# Copilot Instructions for QGEP2TWW

## Project Overview

QGEP2TWW is a migration toolkit for transitioning wastewater management databases from QGEP (old system, VSA 2015) to TWW/TEKSI Wastewater (new system, VSA 2020.1+). This is a **data migration and database adaptation framework**, not application code.

## Core Architecture

The migration follows a strict sequence across three phases:

1. **QGEP Preparation** (`QGEP/` folder) - Upgrade, conform, and export QGEP databases to VSA 2015 standard
2. **Data Conversion** - External VSA converter tool (2015 → 2020.1)
3. **TWW Integration** (`TWW/` folder) - Import converted data into new TWW system

### Key Directories

- **`QGEP/`** - Scripts for upgrading and preparing QGEP for export
  - `QGEP/Custom.sql` - Generic structure modifications (e.g., geometry type changes)
  - `QGEP/Scripts/` - Standard migration scripts (organisations, wastewater structures)
  - `QGEP/Pully/` - Municipality-specific customizations
- **`TWW/`** - Scripts for initializing and importing into TWW
- **`QGEP/INTERLIS/`** - INTERLIS schema definitions and validation rules

## Critical Design Patterns

### 1. Constraint Handling
Database constraints are intentionally dropped during migration (see `QGEP/Pully/001_modify_constraints.sql`). This prevents:
- Foreign key violations when inserting data in non-standard order
- Data validation failures during intermediate transformation states

**Pattern**: Use `ALTER TABLE ... DROP CONSTRAINT` with `IF EXISTS` clause to safely remove constraints. Re-add them only after all data is migrated.

### 2. Data Migration Pattern
All migration scripts use the same INSERT pattern:
```sql
INSERT INTO target_schema.table (columns)
SELECT columns FROM source_schema.table
WHERE obj_id NOT IN (SELECT obj_id FROM target_schema.table);
```

This prevents duplicate imports when scripts are run multiple times. Key files exemplifying this:
- [`QGEP/Scripts/01_organisations.sql`](QGEP/Scripts/01_organisations.sql) - Migrate organisations QGEP → TWW
- [`QGEP/Scripts/02_watewater_structures.sql`](QGEP/Scripts/02_watewater_structures.sql) - Migrate wastewater structures

### 3. Municipality-Specific Customizations
Pully-specific scripts handle:
- Custom organisations (municipalities, private entities, associations) - [`delta_organisations_qgep_pully.sql`](QGEP/Pully/delta_organisations_qgep_pully.sql)
- Constraint modifications unique to Pully
- Geometry type conversions (e.g., MultiPolygonZ, SRID 2056)

**When modifying**: Always create municipality-specific versions in subdirectories rather than generic scripts.

## Important Constraints & Workarounds

### Schema Naming
- QGEP uses schema: `qgep_od`
- TWW uses schema: `tww_od`
- Always fully-qualify table references: `qgep_od.table_name`, not `table_name`

### Object Integrity Checks
QGEP validates that all `wastewater_structure` records have corresponding subclass entries (manhole, special_structure, discharge_point, infiltration_installation, wwtp_structure, channel). The validation query in [`delta_organisations_qgep_pully.sql`](QGEP/Pully/delta_organisations_qgep_pully.sql) shows how to identify orphaned records.

### Geometry Handling
- Source (QGEP): `detail_geometry3d_geometry` (MultiPolygonZ)
- Target (TWW): `detail_geometry_geometry` (various types)
- Conversions must specify SRID 2056 (Swiss coordinate system)

### Version Requirements
- **QGEP migration**: pum ≤ 0.1.10, pirogue 1.4.1, psycopg2
- **TWW setup**: pum ≥ 1.1.14, pirogue 3.0.0, psycopg (3.x), PostgreSQL 13+
- Maintain separate QGEP/TWW tool environments (e.g., separate osgeo4w installations)

## Development Workflow

When adding new migration steps:

1. **Check existing patterns** in `QGEP/Scripts/` or `QGEP/Pully/` for similar operations
2. **Use idempotent scripts** - always check `WHERE obj_id NOT IN (...)` to allow re-running
3. **Document integration checks** - include validation queries (see comments in Pully scripts)
4. **Test data integrity** - verify no orphaned records exist after migration
5. **Add municipality-specific variants** if different rules apply to different regions

## Code Comments & Documentation

- SQL scripts include inline error messages showing QGEP validation expectations
- README files in each directory explain purpose and prerequisites
- The main README documents the full migration path with links to detailed wiki steps
