-- 1. Find all real multiple geometries

SELECT 
  obj_id,
  dump.path AS index_geom,
  ST_FORCECURVE(dump.geom)::geometry(CURVEPOLYGONZ, 2056) AS simple_geom
FROM 
  qgep_od.wastewater_structure ws,
  LATERAL ST_Dump(ws.detail_geometry_geometry) AS dump
WHERE
  dump.geom IS NOT NULL
  AND dump.path[1] > 1
;


-- List of obj_id with multiple geometries

/*
('ch176dc9WN022275',
'ch176dc9WN022275',
'ch176dc9WN021365',
'ch176dc9WN021365',
'ch176dc9WN022256',
'ch176dc9WS012473',
'ch176dc9WS023498',
'ch176dc9WS023406',
'ch176dc9WS023735',
'ch176dc9WS024877',
'ch176dc9WS024878')

*/

/*
    Wastewater structures geometries
*/

-- Add new column to store original geometries
ALTER TABLE qgep_od.wastewater_structure 
ADD COLUMN detail_geometry_geometry_2 geometry(MULTIPOLYGONZ, 2056);

-- Copy old geometries to new column
UPDATE qgep_od.wastewater_structure 
SET detail_geometry_geometry_2 = detail_geometry_geometry
WHERE detail_geometry_geometry IS NOT NULL;

-- Set to NULL geometries to avoid issues during type change
UPDATE qgep_od.wastewater_structure 
SET detail_geometry_geometry = NULL
WHERE detail_geometry_geometry IS NOT NULL;

-- Set new geometry type
ALTER TABLE qgep_od.wastewater_structure
ALTER COLUMN detail_geometry_geometry 
SET DATA TYPE geometry(CURVEPOLYGONZ, 2056);

/* -- SELECTION
SELECT obj_id,ST_ASTEXT(ST_FORCECURVE(dump.geom)::geometry(CURVEPOLYGONZ, 2056))
FROM qgep_od.wastewater_structure ws,
LATERAL ST_Dump(ws.detail_geometry_geometry_2) AS dump
WHERE dump.geom IS NOT NULL
AND dump.path[1] = 1;
*/

UPDATE qgep_od.wastewater_structure ws
SET detail_geometry_geometry = ST_FORCECURVE(selection.geom)::Geometry(CurvePolygonZ,2056)
FROM (
	SELECT obj_id, (ST_Dump(ST_CollectionExtract(detail_geometry_geometry_2, 3))).geom
	FROM qgep_od.wastewater_structure
	WHERE detail_geometry_geometry_2 IS NOT NULL
) selection
WHERE ws.obj_id = selection.obj_id;

/* Same treatment for reaches but with a conversion to curved geometries */

-- Add new column to store original geometries
ALTER TABLE qgep_od.reach 
ADD COLUMN progression_geometry_2 geometry(LINESTRINGZ, 2056);

-- Copy old geometries to new column
UPDATE qgep_od.reach 
SET progression_geometry_2 = progression_geometry
WHERE progression_geometry IS NOT NULL;

-- Remove NOT NULL constraint if exists
ALTER TABLE qgep_od.reach
ALTER COLUMN progression_geometry DROP NOT NULL;

-- Set to NULL geometries to avoid issues during type change
UPDATE qgep_od.reach 
SET progression_geometry = NULL
WHERE progression_geometry IS NOT NULL;

-- Execute drop_view.sql

-- Set new geometry type
ALTER TABLE qgep_od.reach
ALTER COLUMN progression_geometry 
SET DATA TYPE geometry(COMPOUNDCURVEZ, 2056);

-- Fill with curved geometries
UPDATE qgep_od.reach r
SET progression_geometry = ST_FORCECURVE(r.progression_geometry_2)::geometry(COMPOUNDCURVEZ, 2056)
WHERE r.progression_geometry_2 IS NOT NULL;
