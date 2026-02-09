/*
    Ensure that all wastewater structures have a dataowner, provider, owner and operator.
    Sets it as unknown (ch176dc9OG000003) if it is null. 
    This is necessary to ensure that the data can be migrated to the new TWW application without any issues.
*/

-- dataowner Has to be fixed or identifier should not be equal
UPDATE qgep_od.wastewater_structure
SET fk_dataowner = 'ch176dc9OG000003'
where fk_dataowner IS NULL;

UPDATE qgep_od.wastewater_structure
SET fk_provider = 'ch176dc9OG000003'
where fk_provider IS NULL;

UPDATE qgep_od.wastewater_structure
SET fk_owner = 'ch176dc9OG000003'
where fk_owner IS NULL;

UPDATE qgep_od.wastewater_structure
SET fk_operator = 'ch176dc9OG000003'
where fk_operator IS NULL;