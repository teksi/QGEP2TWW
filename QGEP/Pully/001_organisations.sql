/*
    This script is used to fix organisations in the QGEP database.
    Obj_id are added to the subclasses of organisation to avoid integrity check errors during migration.
    obj_id are converted into a varchar 16 to be compliant with the expected INTERLIS TID format.
*/

/* TO AVOID 
ERROR: number of subclass elements of wastewater_structure NOT CORRECT in schema qgep_od: 
Add missing obj_id in wastewater_structure subclasses so that number of subclass elements match wastewater_structure elements. 
See qgep logs tab for details.
*/

/* Expected
Sucess: OK: Integrity checks organisation
*/

-- Complete subclasses of organisation with missing obj_id to avoid integrity check errors.

-- Insert into Municipalities
INSERT INTO qgep_od.municipality (obj_id)
VALUES 
( '1' ), --public (pully or belmont)
( '7' ); -- Lausanne ou entente intercommunale

-- Insert into Cantons
INSERT INTO qgep_od.canton (obj_id)
VALUES
( '5' ); -- DGMR - Canton de Vaud

-- Insert Private / unknown
INSERT INTO qgep_od.private (obj_id)
VALUES
( '2' ), -- privé ou privé communal
( '3' ), -- inconnu ou à définir
( '4' ), -- CFF / SBB ou OFROU / ASTRA
( '6' ); -- OFROU / ASTRA


-- Drop constraints

ALTER TABLE IF EXISTS qgep_od.txt_symbol DROP CONSTRAINT rel_txt_symbol_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.txt_symbol DROP CONSTRAINT rel_txt_symbol_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.mutation DROP CONSTRAINT rel_od_mutation_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.mutation DROP CONSTRAINT rel_od_mutation_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.aquifier DROP CONSTRAINT rel_od_aquifier_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.aquifier DROP CONSTRAINT rel_od_aquifier_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.surface_water_bodies DROP CONSTRAINT rel_od_surface_water_bodies_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.surface_water_bodies DROP CONSTRAINT rel_od_surface_water_bodies_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.water_course_segment DROP CONSTRAINT rel_od_water_course_segment_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.water_course_segment DROP CONSTRAINT rel_od_water_course_segment_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.water_catchment DROP CONSTRAINT rel_od_water_catchment_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.water_catchment DROP CONSTRAINT rel_od_water_catchment_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.river_bank DROP CONSTRAINT rel_od_river_bank_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.river_bank DROP CONSTRAINT rel_od_river_bank_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.river_bed DROP CONSTRAINT rel_od_river_bed_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.river_bed DROP CONSTRAINT rel_od_river_bed_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.sector_water_body DROP CONSTRAINT rel_od_sector_water_body_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.sector_water_body DROP CONSTRAINT rel_od_sector_water_body_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.organisation DROP CONSTRAINT rel_od_organisation_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.organisation DROP CONSTRAINT rel_od_organisation_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.wastewater_structure DROP CONSTRAINT rel_od_wastewater_structure_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.wastewater_structure DROP CONSTRAINT rel_od_wastewater_structure_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.maintenance_event DROP CONSTRAINT rel_od_maintenance_event_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.maintenance_event DROP CONSTRAINT rel_od_maintenance_event_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.zone DROP CONSTRAINT rel_od_zone_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.zone DROP CONSTRAINT rel_od_zone_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.pipe_profile DROP CONSTRAINT rel_od_pipe_profile_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.pipe_profile DROP CONSTRAINT rel_od_pipe_profile_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.wwtp_energy_use DROP CONSTRAINT rel_od_wwtp_energy_use_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.wwtp_energy_use DROP CONSTRAINT rel_od_wwtp_energy_use_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.waste_water_treatment DROP CONSTRAINT rel_od_waste_water_treatment_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.waste_water_treatment DROP CONSTRAINT rel_od_waste_water_treatment_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.sludge_treatment DROP CONSTRAINT rel_od_sludge_treatment_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.sludge_treatment DROP CONSTRAINT rel_od_sludge_treatment_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.control_center DROP CONSTRAINT rel_od_control_center_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.control_center DROP CONSTRAINT rel_od_control_center_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.water_control_structure DROP CONSTRAINT rel_od_water_control_structure_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.water_control_structure DROP CONSTRAINT rel_od_water_control_structure_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.fish_pass DROP CONSTRAINT rel_od_fish_pass_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.fish_pass DROP CONSTRAINT rel_od_fish_pass_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.bathing_area DROP CONSTRAINT rel_od_bathing_area_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.bathing_area DROP CONSTRAINT rel_od_bathing_area_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.hydr_geometry DROP CONSTRAINT rel_od_hydr_geometry_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.hydr_geometry DROP CONSTRAINT rel_od_hydr_geometry_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.wastewater_networkelement DROP CONSTRAINT rel_od_wastewater_networkelement_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.wastewater_networkelement DROP CONSTRAINT rel_od_wastewater_networkelement_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.reach_point DROP CONSTRAINT rel_od_reach_point_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.reach_point DROP CONSTRAINT rel_od_reach_point_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.profile_geometry DROP CONSTRAINT rel_od_profile_geometry_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.profile_geometry DROP CONSTRAINT rel_od_profile_geometry_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.hydr_geom_relation DROP CONSTRAINT rel_od_hydr_geom_relation_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.hydr_geom_relation DROP CONSTRAINT rel_od_hydr_geom_relation_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.mechanical_pretreatment DROP CONSTRAINT rel_od_mechanical_pretreatment_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.mechanical_pretreatment DROP CONSTRAINT rel_od_mechanical_pretreatment_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.retention_body DROP CONSTRAINT rel_od_retention_body_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.retention_body DROP CONSTRAINT rel_od_retention_body_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.overflow_char DROP CONSTRAINT rel_od_overflow_char_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.overflow_char DROP CONSTRAINT rel_od_overflow_char_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.hq_relation DROP CONSTRAINT rel_od_hq_relation_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.hq_relation DROP CONSTRAINT rel_od_hq_relation_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.structure_part DROP CONSTRAINT rel_od_structure_part_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.structure_part DROP CONSTRAINT rel_od_structure_part_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.connection_object DROP CONSTRAINT rel_od_connection_object_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.connection_object DROP CONSTRAINT rel_od_connection_object_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.hazard_source DROP CONSTRAINT rel_od_hazard_source_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.hazard_source DROP CONSTRAINT rel_od_hazard_source_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.accident DROP CONSTRAINT rel_od_accident_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.accident DROP CONSTRAINT rel_od_accident_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.substance DROP CONSTRAINT rel_od_substance_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.substance DROP CONSTRAINT rel_od_substance_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.catchment_area DROP CONSTRAINT rel_od_catchment_area_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.catchment_area DROP CONSTRAINT rel_od_catchment_area_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.surface_runoff_parameters DROP CONSTRAINT rel_od_surface_runoff_parameters_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.surface_runoff_parameters DROP CONSTRAINT rel_od_surface_runoff_parameters_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.measuring_point DROP CONSTRAINT rel_od_measuring_point_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.measuring_point DROP CONSTRAINT rel_od_measuring_point_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.measuring_device DROP CONSTRAINT rel_od_measuring_device_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.measuring_device DROP CONSTRAINT rel_od_measuring_device_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.measurement_series DROP CONSTRAINT rel_od_measurement_series_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.measurement_series DROP CONSTRAINT rel_od_measurement_series_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.measurement_result DROP CONSTRAINT rel_od_measurement_result_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.measurement_result DROP CONSTRAINT rel_od_measurement_result_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.overflow DROP CONSTRAINT rel_od_overflow_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.overflow DROP CONSTRAINT rel_od_overflow_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.throttle_shut_off_unit DROP CONSTRAINT rel_od_throttle_shut_off_unit_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.throttle_shut_off_unit DROP CONSTRAINT rel_od_throttle_shut_off_unit_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.hydraulic_char_data DROP CONSTRAINT rel_od_hydraulic_char_data_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.hydraulic_char_data DROP CONSTRAINT rel_od_hydraulic_char_data_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.wastewater_structure_symbol DROP CONSTRAINT rel_od_wastewater_structure_symbol_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.wastewater_structure_symbol DROP CONSTRAINT rel_od_wastewater_structure_symbol_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.damage DROP CONSTRAINT IF EXISTS rel_od_damage_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.damage DROP CONSTRAINT IF EXISTS rel_od_damage_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.data_media DROP CONSTRAINT IF EXISTS rel_od_data_media_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.data_media DROP CONSTRAINT IF EXISTS rel_od_data_media_fk_dataprovider;
ALTER TABLE IF EXISTS qgep_od.file DROP CONSTRAINT IF EXISTS rel_od_file_fk_dataowner;
ALTER TABLE IF EXISTS qgep_od.file DROP CONSTRAINT IF EXISTS rel_od_file_fk_dataprovider;

-- Recreate constraints with ON UPDATE CASCADE

ALTER TABLE qgep_od.txt_symbol ADD CONSTRAINT rel_txt_symbol_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.txt_symbol ADD CONSTRAINT rel_txt_symbol_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.mutation ADD CONSTRAINT rel_od_mutation_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.mutation ADD CONSTRAINT rel_od_mutation_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.aquifier ADD CONSTRAINT rel_od_aquifier_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.aquifier ADD CONSTRAINT rel_od_aquifier_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.surface_water_bodies ADD CONSTRAINT rel_od_surface_water_bodies_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.surface_water_bodies ADD CONSTRAINT rel_od_surface_water_bodies_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.water_course_segment ADD CONSTRAINT rel_od_water_course_segment_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.water_course_segment ADD CONSTRAINT rel_od_water_course_segment_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.water_catchment ADD CONSTRAINT rel_od_water_catchment_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.water_catchment ADD CONSTRAINT rel_od_water_catchment_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.river_bank ADD CONSTRAINT rel_od_river_bank_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.river_bank ADD CONSTRAINT rel_od_river_bank_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.river_bed ADD CONSTRAINT rel_od_river_bed_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.river_bed ADD CONSTRAINT rel_od_river_bed_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.sector_water_body ADD CONSTRAINT rel_od_sector_water_body_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.sector_water_body ADD CONSTRAINT rel_od_sector_water_body_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.organisation ADD CONSTRAINT rel_od_organisation_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.organisation ADD CONSTRAINT rel_od_organisation_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wastewater_structure ADD CONSTRAINT rel_od_wastewater_structure_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wastewater_structure ADD CONSTRAINT rel_od_wastewater_structure_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.maintenance_event ADD CONSTRAINT rel_od_maintenance_event_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.maintenance_event ADD CONSTRAINT rel_od_maintenance_event_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.zone ADD CONSTRAINT rel_od_zone_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.zone ADD CONSTRAINT rel_od_zone_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.pipe_profile ADD CONSTRAINT rel_od_pipe_profile_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.pipe_profile ADD CONSTRAINT rel_od_pipe_profile_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wwtp_energy_use ADD CONSTRAINT rel_od_wwtp_energy_use_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wwtp_energy_use ADD CONSTRAINT rel_od_wwtp_energy_use_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.waste_water_treatment ADD CONSTRAINT rel_od_waste_water_treatment_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.waste_water_treatment ADD CONSTRAINT rel_od_waste_water_treatment_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.sludge_treatment ADD CONSTRAINT rel_od_sludge_treatment_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.sludge_treatment ADD CONSTRAINT rel_od_sludge_treatment_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.control_center ADD CONSTRAINT rel_od_control_center_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.control_center ADD CONSTRAINT rel_od_control_center_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.water_control_structure ADD CONSTRAINT rel_od_water_control_structure_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.water_control_structure ADD CONSTRAINT rel_od_water_control_structure_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.fish_pass ADD CONSTRAINT rel_od_fish_pass_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.fish_pass ADD CONSTRAINT rel_od_fish_pass_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.bathing_area ADD CONSTRAINT rel_od_bathing_area_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.bathing_area ADD CONSTRAINT rel_od_bathing_area_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hydr_geometry ADD CONSTRAINT rel_od_hydr_geometry_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hydr_geometry ADD CONSTRAINT rel_od_hydr_geometry_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wastewater_networkelement ADD CONSTRAINT rel_od_wastewater_networkelement_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wastewater_networkelement ADD CONSTRAINT rel_od_wastewater_networkelement_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.reach_point ADD CONSTRAINT rel_od_reach_point_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.reach_point ADD CONSTRAINT rel_od_reach_point_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.profile_geometry ADD CONSTRAINT rel_od_profile_geometry_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.profile_geometry ADD CONSTRAINT rel_od_profile_geometry_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hydr_geom_relation ADD CONSTRAINT rel_od_hydr_geom_relation_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hydr_geom_relation ADD CONSTRAINT rel_od_hydr_geom_relation_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.mechanical_pretreatment ADD CONSTRAINT rel_od_mechanical_pretreatment_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.mechanical_pretreatment ADD CONSTRAINT rel_od_mechanical_pretreatment_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.retention_body ADD CONSTRAINT rel_od_retention_body_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.retention_body ADD CONSTRAINT rel_od_retention_body_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.overflow_char ADD CONSTRAINT rel_od_overflow_char_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.overflow_char ADD CONSTRAINT rel_od_overflow_char_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hq_relation ADD CONSTRAINT rel_od_hq_relation_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hq_relation ADD CONSTRAINT rel_od_hq_relation_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.structure_part ADD CONSTRAINT rel_od_structure_part_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.structure_part ADD CONSTRAINT rel_od_structure_part_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.connection_object ADD CONSTRAINT rel_od_connection_object_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.connection_object ADD CONSTRAINT rel_od_connection_object_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hazard_source ADD CONSTRAINT rel_od_hazard_source_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hazard_source ADD CONSTRAINT rel_od_hazard_source_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.accident ADD CONSTRAINT rel_od_accident_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.accident ADD CONSTRAINT rel_od_accident_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.substance ADD CONSTRAINT rel_od_substance_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.substance ADD CONSTRAINT rel_od_substance_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.catchment_area ADD CONSTRAINT rel_od_catchment_area_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.catchment_area ADD CONSTRAINT rel_od_catchment_area_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.surface_runoff_parameters ADD CONSTRAINT rel_od_surface_runoff_parameters_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.surface_runoff_parameters ADD CONSTRAINT rel_od_surface_runoff_parameters_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measuring_point ADD CONSTRAINT rel_od_measuring_point_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measuring_point ADD CONSTRAINT rel_od_measuring_point_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measuring_device ADD CONSTRAINT rel_od_measuring_device_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measuring_device ADD CONSTRAINT rel_od_measuring_device_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measurement_series ADD CONSTRAINT rel_od_measurement_series_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measurement_series ADD CONSTRAINT rel_od_measurement_series_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measurement_result ADD CONSTRAINT rel_od_measurement_result_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.measurement_result ADD CONSTRAINT rel_od_measurement_result_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.overflow ADD CONSTRAINT rel_od_overflow_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.overflow ADD CONSTRAINT rel_od_overflow_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.throttle_shut_off_unit ADD CONSTRAINT rel_od_throttle_shut_off_unit_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.throttle_shut_off_unit ADD CONSTRAINT rel_od_throttle_shut_off_unit_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hydraulic_char_data ADD CONSTRAINT rel_od_hydraulic_char_data_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.hydraulic_char_data ADD CONSTRAINT rel_od_hydraulic_char_data_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wastewater_structure_symbol ADD CONSTRAINT rel_od_wastewater_structure_symbol_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.wastewater_structure_symbol ADD CONSTRAINT rel_od_wastewater_structure_symbol_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE qgep_od.damage ADD CONSTRAINT rel_od_damage_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null;
ALTER TABLE qgep_od.damage ADD CONSTRAINT rel_od_damage_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null;
ALTER TABLE qgep_od.data_media ADD CONSTRAINT rel_od_data_media_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null;
ALTER TABLE qgep_od.data_media ADD CONSTRAINT rel_od_data_media_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null;
ALTER TABLE qgep_od.file ADD CONSTRAINT rel_od_file_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null;
ALTER TABLE qgep_od.file ADD CONSTRAINT rel_od_file_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qgep_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null;


-- Fix values for Pully

UPDATE  qgep_od.organisation CASCADE
SET obj_id = 'ch176dc9OG000001'
WHERE obj_id = '1';

UPDATE  qgep_od.organisation CASCADE
SET obj_id = 'ch176dc9OG000002'
WHERE obj_id = '2';

UPDATE  qgep_od.organisation CASCADE
SET obj_id = 'ch176dc9OG000003'
WHERE obj_id = '3';

UPDATE  qgep_od.organisation CASCADE
SET obj_id = 'ch176dc9OG000004'
WHERE obj_id = '4';

UPDATE  qgep_od.organisation CASCADE
SET obj_id = 'ch176dc9OG000005'
WHERE obj_id = '5';

UPDATE  qgep_od.organisation CASCADE
SET obj_id = 'ch176dc9OG000006'
WHERE obj_id = '6';

UPDATE  qgep_od.organisation CASCADE
SET obj_id = 'ch176dc9OG000007'
WHERE obj_id = '7';

