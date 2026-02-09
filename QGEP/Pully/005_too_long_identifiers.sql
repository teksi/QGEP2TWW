-- Update wastewater_structure identifier if too long
UPDATE qgep_od.wastewater_structure
SET identifier = obj_id
WHERE identifier IS NOT NULL AND LENGTH(identifier) > 20;

-- Update wastewater_networkelement identifier if too long (Pipes, network nodes, ...)
UPDATE qgep_od.wastewater_networkelement
SET identifier = fk_wastewater_structure
WHERE identifier IS NOT NULL AND LENGTH(identifier) > 20 AND fk_wastewater_structure IS NOT NULL;

-- Update structure_part identifier if too long (Covers, ...)
UPDATE qgep_od.structure_part
SET identifier = fk_wastewater_structure
WHERE identifier IS NOT NULL AND LENGTH(identifier) > 20 AND fk_wastewater_structure IS NOT NULL;

-- Update reach_point identifier if too long (Inlets, Outlets, ...)
UPDATE qgep_od.reach_point
SET identifier = fk_wastewater_networkelement
WHERE identifier IS NOT NULL AND LENGTH(identifier) > 20 AND fk_wastewater_networkelement IS NOT NULL;

-- Update wastewater_structure location_name if too long
UPDATE qgep_od.wastewater_structure
SET location_name = LEFT(location_name, 20)
WHERE location_name IS NOT NULL AND LENGTH(location_name) > 20;