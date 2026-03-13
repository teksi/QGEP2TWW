/*
    This script is used to fix the identifiers of the wastewater structures, network elements, structure parts, maintenance events and files in the QGEP database. 
    The original identifiers are stored in a new column called pully_identifier, and the identifier column is set to the obj_id to avoid issues during migration. 
    This is necessary to ensure that the data can be migrated to the new QGEP application without any issues.
*/

SELECT qgep_sys.drop_symbology_triggers() ;

---- wastewaster_structure
-- Add new column to store original geometries
ALTER TABLE qgep_od.wastewater_structure 
ADD COLUMN pully_identifier varchar(60);

-- Copy old geometries to new column
UPDATE qgep_od.wastewater_structure 
SET pully_identifier = identifier
WHERE identifier IS NOT NULL;

-- Set to identifier to obj_id to avoid issues during migration
UPDATE qgep_od.wastewater_structure 
SET identifier = obj_id;

-- Add new column to store original geometries
ALTER TABLE qgep_od.wastewater_networkelement 
ADD COLUMN pully_identifier varchar(100);

-- Copy old geometries to new column
UPDATE qgep_od.wastewater_networkelement 
SET pully_identifier = identifier
WHERE identifier IS NOT NULL;

-- Set to identifier to obj_id to avoid issues during migration
UPDATE qgep_od.wastewater_networkelement 
SET identifier = obj_id;

---- structure parts
-- Add new column to store original geometries
ALTER TABLE qgep_od.structure_part 
ADD COLUMN pully_identifier varchar(100);

-- Copy old geometries to new column
UPDATE qgep_od.structure_part 
SET pully_identifier = identifier
WHERE identifier IS NOT NULL;

-- Set to identifier to obj_id to avoid issues during migration
UPDATE qgep_od.structure_part 
SET identifier = obj_id;

---- maintenance events
-- Add new column to store original geometries
ALTER TABLE qgep_od.maintenance_event 
ADD COLUMN pully_identifier varchar(60);

-- Copy old geometries to new column
UPDATE qgep_od.maintenance_event 
SET pully_identifier = identifier
WHERE identifier IS NOT NULL;

-- Set to identifier to obj_id to avoid issues during migration
UPDATE qgep_od.maintenance_event 
SET identifier = obj_id;

---- files
-- Add new column to store original geometries
ALTER TABLE qgep_od.file 
ADD COLUMN pully_identifier varchar(60);

-- Copy old geometries to new column
UPDATE qgep_od.file 
SET pully_identifier = identifier
WHERE identifier IS NOT NULL;

-- Set to identifier to obj_id to avoid issues during migration
UPDATE qgep_od.file 
SET identifier = obj_id;