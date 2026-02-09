/*
    Wastewater structures that are not related to the wastewater network should be removed from the database. 
    These structures are not used in the QGEP application and can cause confusion for users. 
    The following query identifies these structures and deletes them from the database.
    This is necessary to ensure INTERLIS compliance and to maintain the integrity of the data in the QGEP application.
*/

SELECT ws.obj_id

   FROM qgep_od.wastewater_structure ws
     LEFT JOIN qgep_od.cover main_co ON main_co.obj_id::text = ws.fk_main_cover::text
     LEFT JOIN qgep_od.structure_part main_co_sp ON main_co_sp.obj_id::text = ws.fk_main_cover::text
     LEFT JOIN qgep_od.manhole ma ON ma.obj_id::text = ws.obj_id::text
     LEFT JOIN qgep_od.special_structure ss ON ss.obj_id::text = ws.obj_id::text
     LEFT JOIN qgep_od.discharge_point dp ON dp.obj_id::text = ws.obj_id::text
     LEFT JOIN qgep_od.infiltration_installation ii ON ii.obj_id::text = ws.obj_id::text
     LEFT JOIN qgep_od.wwtp_structure wt ON wt.obj_id::text = ws.obj_id::text
     LEFT JOIN qgep_od.wastewater_networkelement ne ON ne.obj_id::text = ws.fk_main_wastewater_node::text
     LEFT JOIN qgep_od.wastewater_node wn ON wn.obj_id::text = ws.fk_main_wastewater_node::text
     LEFT JOIN qgep_od.channel ch ON ch.obj_id::text = ws.obj_id::text
            WHERE ma.obj_id IS NULL
            AND ss.obj_id IS NULL 
            AND dp.obj_id IS NULL 
            AND ii.obj_id IS NULL 
            AND wt.obj_id IS NULL 
            AND ch.obj_id IS NULL ;

-- Remove unrelated wastewater strucures
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018283';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018681';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018682';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018742';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018765';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018920';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019311';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS021921';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018834';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018008';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018010';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018011';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018012';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018015';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018073';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018172';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018067';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018139';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018141';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018157';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018158';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018160';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018174';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018175';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018176';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018180';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018419';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018447';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018653';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018655';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018683';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018684';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018685';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018686';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018688';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018706';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018824';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS017898';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018840';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS017910';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018006';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018007';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018035';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018919';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018921';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018922';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018924';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018953';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018954';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS017681';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018955';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019008';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019009';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS017856';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS017878';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019053';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019054';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018298';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018368';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018402';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018403';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018148';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018188';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018191';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018195';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018434';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018435';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018449';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018452';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018273';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018275';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018277';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018279';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018280';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018581';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018334';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018335';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018336';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018339';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018340';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018341';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018342';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018357';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018358';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018679';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018680';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018404';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018689';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018695';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018696';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018534';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018535';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018551';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018555';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018565';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018586';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018598';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018600';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018635';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018636';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018637';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018638';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018782';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018678';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018796';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018797';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018727';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018820';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018757';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018865';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018925';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018948';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018952';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018956';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018957';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018958';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS018961';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019045';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019048';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019309';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019314';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019202';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019305';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS019307';
DELETE FROM qgep_od.vw_qgep_wastewater_structure ws WHERE ws.obj_id = 'ch176dc9WS020646';