BEGIN;

DROP SCHEMA opx CASCADE ;

CREATE SCHEMA opx AUTHORIZATION opxuser;
--
-- Create model User
--
CREATE TABLE "opx"."user" ("last_login" timestamp with time zone NULL, "userid" uuid NOT NULL PRIMARY KEY, "useremail" varchar(100) NOT NULL UNIQUE, "password" varchar(255) NOT NULL, "usertoken" varchar(255) NULL);
--
-- Create model City
--
CREATE TABLE "opx"."city" ("city_id" varchar(50) NOT NULL PRIMARY KEY, "city_name" varchar(100) NOT NULL);
--
-- Create model Conflict
--
CREATE TABLE "opx"."conflict" ("conflict_id" uuid NOT NULL PRIMARY KEY, "conflict_name" varchar(50) NOT NULL);
--
-- Create model Context
--
CREATE TABLE "opx"."context" ("context_id" uuid NOT NULL PRIMARY KEY, "context_description" varchar(500) NOT NULL);
--
-- Create model Decision
--
CREATE TABLE "opx"."decision" ("decs_id" uuid NOT NULL PRIMARY KEY, "decs_name" varchar(100) NOT NULL UNIQUE, "decs_description" varchar(500) NOT NULL);
--
-- Create model DimensionType
--
CREATE TABLE "opx"."dimension_type" ("dim_type_id" uuid NOT NULL PRIMARY KEY, "dim_type_name" varchar(100) NOT NULL, "dim_type_description" varchar(300) NULL);
--
-- Create model EducationLevel
--
CREATE TABLE "opx"."education_level" ("educlevel_id" uuid NOT NULL PRIMARY KEY, "educlevel_name" varchar(100) NOT NULL, "isactive" integer NOT NULL);
--
-- Create model Gender
--
CREATE TABLE "opx"."gender" ("gender_id" uuid NOT NULL PRIMARY KEY, "gender_name" varchar(100) NOT NULL, "isactive" integer NOT NULL);
--
-- Create model Instrument
--
CREATE TABLE "opx"."instrument" ("instrument_id" uuid NOT NULL PRIMARY KEY, "external_id" varchar(255) NOT NULL, "instrument_type" integer NOT NULL, "instrument_name" varchar(100) NOT NULL, "instrument_description" varchar(300) NOT NULL, "geojson" jsonb NULL);
--
-- Create model Neighborhood
--
CREATE TABLE "opx"."neighborhood" ("neighb_id" integer NOT NULL PRIMARY KEY, "neighb_name" varchar(100) NOT NULL, "city_id" varchar(50) NOT NULL);
--
-- Create model OsmElement
--
CREATE TABLE "opx"."osm_element" ("osmelement_id" uuid NOT NULL PRIMARY KEY, "osmelement_name" varchar(255) NOT NULL, "osm_key" varchar(255) NOT NULL, "osm_value" varchar(255) NOT NULL, "closed_way" integer NOT NULL);
--
-- Create model Params
--
CREATE TABLE "opx"."params" ("params_id" varchar(500) NOT NULL PRIMARY KEY, "params_value" varchar(500) NOT NULL, "params_description" varchar(500) NOT NULL);
--
-- Create model PeaceInitiative
--
CREATE TABLE "opx"."peace_initiative" ("peace_id" uuid NOT NULL PRIMARY KEY, "peace_name" varchar(100) NOT NULL, "peace_description" varchar(500) NOT NULL, "peace_geojson" jsonb NOT NULL, "peace_start_date" date NOT NULL, "peace_end_date" date NULL, "peace_tag" varchar(50) NOT NULL, "osm_icon_tag" varchar(30) NOT NULL, "isvalid" integer NULL);
--
-- Create model Permissionn
--
CREATE TABLE "opx"."permissionn" ("perm_id" uuid NOT NULL PRIMARY KEY, "perm_codename" varchar(100) NOT NULL, "perm_name" varchar(255) NOT NULL);
--
-- Create model Person
--
CREATE TABLE "opx"."person" ("pers_id" uuid NOT NULL PRIMARY KEY, "pers_name" varchar(255) NOT NULL, "pers_lastname" varchar(255) NOT NULL, "pers_birthdate" date NOT NULL, "pers_telephone" varchar(20) NOT NULL, "pers_latitude" varchar(30) NULL, "pers_longitude" varchar(30) NULL, "hour_location" varchar(100) NULL, "pers_score" integer NULL, "pers_creation_date" timestamp with time zone NOT NULL, "isactive" integer NOT NULL, "isemployee" integer NOT NULL, "education_level_id" uuid NOT NULL, "gender_id" uuid NOT NULL, "neighborhood_id" integer NOT NULL);
--
-- Create model Project
--
CREATE TABLE "opx"."project" ("proj_id" uuid NOT NULL PRIMARY KEY, "proj_name" varchar(100) NOT NULL UNIQUE, "proj_description" varchar(500) NOT NULL, "proj_external_id" varchar(500) NOT NULL, "proj_creation_date" timestamp with time zone NOT NULL, "proj_close_date" date NULL, "proj_start_date" date NULL, "proj_completness" double precision NOT NULL, "isactive" integer NOT NULL, "proj_owner_id" uuid NOT NULL);
--
-- Create model ProjectType
--
CREATE TABLE "opx"."project_type" ("projtype_id" uuid NOT NULL PRIMARY KEY, "projtype_name" varchar(100) NOT NULL, "projtype_description" varchar(500) NOT NULL);
--
-- Create model Role
--
CREATE TABLE "opx"."role" ("role_id" uuid NOT NULL PRIMARY KEY, "role_name" varchar(50) NOT NULL, "role_description" varchar(255) NOT NULL, "isactive" integer NOT NULL);
--
-- Create model TaskPriority
--
CREATE TABLE "opx"."task_priority" ("priority_id" uuid NOT NULL PRIMARY KEY, "priority_name" varchar(100) NOT NULL, "priority_number" integer NOT NULL);
--
-- Create model TaskRestriction
--
CREATE TABLE "opx"."task_restriction" ("restriction_id" uuid NOT NULL PRIMARY KEY, "start_time" time NULL, "end_time" time NULL, "task_start_date" date NULL, "task_end_date" date NULL);
--
-- Create model TaskType
--
CREATE TABLE "opx"."task_type" ("task_type_id" serial NOT NULL PRIMARY KEY, "task_type_name" varchar(100) NOT NULL, "task_type_description" varchar(300) NOT NULL);
--
-- Create model Team
--
CREATE TABLE "opx"."team" ("team_id" uuid NOT NULL PRIMARY KEY, "team_name" varchar(100) NOT NULL UNIQUE, "team_description" varchar(300) NOT NULL UNIQUE, "team_effectiveness" double precision NOT NULL, "team_leader_id" uuid NOT NULL);
--
-- Create model TerritorialDimension
--
CREATE TABLE "opx"."territorial_dimension" ("dimension_id" uuid NOT NULL PRIMARY KEY, "dimension_name" varchar(100) NOT NULL UNIQUE, "dimension_geojson" jsonb NOT NULL, "neighborhood_id" varchar(100) NULL, "isactive" integer NOT NULL, "preloaded" integer NOT NULL, "dimension_type_id" uuid NOT NULL);
--
-- Create model TeamPerson
--
CREATE TABLE "opx"."team_person" ("teampers_id" uuid NOT NULL PRIMARY KEY, "participation" double precision NOT NULL, "person_id" uuid NOT NULL, "team_id" uuid NOT NULL);
--
-- Create model Task
--
CREATE TABLE "opx"."task" ("task_id" uuid NOT NULL PRIMARY KEY, "task_name" varchar(100) NOT NULL UNIQUE, "task_description" varchar(300) NOT NULL, "task_observation" varchar(1000) NOT NULL, "task_creation_date" timestamp with time zone NOT NULL, "task_quantity" integer NOT NULL, "task_completness" double precision NOT NULL, "isactive" integer NOT NULL, "instrument_id" uuid NOT NULL, "proj_dimension_id" uuid NOT NULL, "project_id" uuid NOT NULL, "task_priority_id" uuid NOT NULL, "task_restriction_id" uuid NOT NULL UNIQUE, "task_type_id" integer NOT NULL, "territorial_dimension_id" uuid NOT NULL);
--
-- Create model Survery
--
CREATE TABLE "opx"."survery" ("survery_id" uuid NOT NULL PRIMARY KEY, "koboid" varchar(255) NOT NULL, "survery_content" jsonb NOT NULL, "survery_state" integer NOT NULL, "survery_observation" varchar(1000) NULL, "instrument_id" uuid NOT NULL, "person_id" uuid NOT NULL, "task_id" uuid NOT NULL);
--
-- Create model RolePermissionn
--
CREATE TABLE "opx"."role_permissionn" ("role_permissionn_id" serial NOT NULL PRIMARY KEY, "permissionn_id" uuid NOT NULL, "role_id" uuid NOT NULL);
--
-- Create model ProjectTerritorialDimension
--
CREATE TABLE "opx"."project_dimension" ("proj_dimension_id" uuid NOT NULL PRIMARY KEY, "project_id" uuid NOT NULL, "territorial_dimension_id" uuid NOT NULL);
--
-- Create model ProjectTeam
--
CREATE TABLE "opx"."project_team" ("proj_team_id" uuid NOT NULL PRIMARY KEY, "project_id" uuid NOT NULL, "team_id" uuid NOT NULL);
--
-- Create model ProjectDecision
--
CREATE TABLE "opx"."project_decision" ("proj_decs_id" uuid NOT NULL PRIMARY KEY, "decision_id" uuid NOT NULL, "project_id" uuid NOT NULL);
--
-- Create model ProjectContext
--
CREATE TABLE "opx"."project_context" ("proj_context_id" uuid NOT NULL PRIMARY KEY, "context_id" uuid NOT NULL, "project_id" uuid NOT NULL);
--
-- Add field project_type to project
--
ALTER TABLE "opx"."project" ADD COLUMN "project_type_id" uuid NOT NULL;
--
-- Create model PersonTask
--
CREATE TABLE "opx"."person_task" ("person_task_id" uuid NOT NULL PRIMARY KEY, "score" integer NULL, "person_id" uuid NOT NULL, "task_id" uuid NOT NULL);
--
-- Add field role to person
--
ALTER TABLE "opx"."person" ADD COLUMN "role_id" uuid NOT NULL;
--
-- Add field user to person
--
ALTER TABLE "opx"."person" ADD COLUMN "user_id" uuid NOT NULL UNIQUE;
--
-- Create model PeaceSchedule
--
CREATE TABLE "opx"."peace_schedule" ("peace_shc_id" uuid NOT NULL PRIMARY KEY, "peace_shc_day" varchar(50) NOT NULL, "peace_shc_time" time NULL, "peace_initiative_id" uuid NOT NULL);
--
-- Add field person to peaceinitiative
--
ALTER TABLE "opx"."peace_initiative" ADD COLUMN "person_id" uuid NOT NULL;
--
-- Create model Notification
--
CREATE TABLE "opx"."notification" ("notification_id" uuid NOT NULL PRIMARY KEY, "notification_type" integer NOT NULL, "description" jsonb NOT NULL, "project_name" varchar(100) NULL, "task_name" varchar(100) NULL, "notification_date" timestamp with time zone NOT NULL, "person_id" uuid NOT NULL);
--
-- Create model DataContext
--
CREATE TABLE "opx"."data_context" ("data_id" uuid NOT NULL PRIMARY KEY, "hdxtag" varchar(100) NOT NULL, "data_value" varchar(100) NOT NULL, "data_type" varchar(100) NOT NULL, "data_description" varchar(500) NOT NULL, "data_geojson" jsonb NOT NULL, "data_date" date NULL, "data_time" time NULL, "context_id" uuid NOT NULL);
--
-- Create model Contextualization
--
CREATE TABLE "opx"."contextualization" ("contxzn_id" uuid NOT NULL PRIMARY KEY, "fact_date" date NOT NULL, "fact_hour" time NOT NULL, "fac_day" integer NOT NULL, "fact_age" integer NOT NULL, "contxzn_quantity" integer NULL, "conflict_id" uuid NOT NULL, "education_level_id" uuid NULL, "gender_id" uuid NULL, "neighborhood_id" integer NULL);
--
-- Create model Comment
--
CREATE TABLE "opx"."comment" ("comment_id" uuid NOT NULL PRIMARY KEY, "comment_title" varchar(100) NOT NULL, "comment_description" varchar(500) NOT NULL, "comment_date" timestamp with time zone NOT NULL, "project_id" uuid NOT NULL);
--
-- Create model Cartography
--
CREATE TABLE "opx"."cartography" ("cartography_id" uuid NOT NULL PRIMARY KEY, "osmid" varchar(100) NOT NULL, "cartography_state" integer NOT NULL, "instrument_id" uuid NOT NULL, "osm_elemtent_id" uuid NOT NULL, "person_id" uuid NOT NULL, "task_id" uuid NOT NULL);
CREATE INDEX "user_useremail_acadcdba_like" ON "opx"."user" ("useremail" varchar_pattern_ops);
CREATE INDEX "city_city_id_56f430dd_like" ON "opx"."city" ("city_id" varchar_pattern_ops);
CREATE INDEX "decision_decs_name_b37cf7a0_like" ON "opx"."decision" ("decs_name" varchar_pattern_ops);
ALTER TABLE "opx"."neighborhood" ADD CONSTRAINT "neighborhood_city_id_c731b982_fk_city_city_id" FOREIGN KEY ("city_id") REFERENCES "opx"."city" ("city_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "neighborhood_city_id_c731b982" ON "opx"."neighborhood" ("city_id");
CREATE INDEX "neighborhood_city_id_c731b982_like" ON "opx"."neighborhood" ("city_id" varchar_pattern_ops);
CREATE INDEX "params_params_id_113244a5_like" ON "opx"."params" ("params_id" varchar_pattern_ops);
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_education_level_id_cc1d15f2_fk_education" FOREIGN KEY ("education_level_id") REFERENCES "opx"."education_level" ("educlevel_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_gender_id_59f5af71_fk_gender_gender_id" FOREIGN KEY ("gender_id") REFERENCES "opx"."gender" ("gender_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_neighborhood_id_427121f5_fk_neighborhood_neighb_id" FOREIGN KEY ("neighborhood_id") REFERENCES "opx"."neighborhood" ("neighb_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "person_education_level_id_cc1d15f2" ON "opx"."person" ("education_level_id");
CREATE INDEX "person_gender_id_59f5af71" ON "opx"."person" ("gender_id");
CREATE INDEX "person_neighborhood_id_427121f5" ON "opx"."person" ("neighborhood_id");
ALTER TABLE "opx"."project" ADD CONSTRAINT "project_proj_owner_id_639c5da3_fk_person_pers_id" FOREIGN KEY ("proj_owner_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "project_proj_name_90a039d1_like" ON "opx"."project" ("proj_name" varchar_pattern_ops);
CREATE INDEX "project_proj_owner_id_639c5da3" ON "opx"."project" ("proj_owner_id");
ALTER TABLE "opx"."team" ADD CONSTRAINT "team_team_leader_id_056b6721_fk_person_pers_id" FOREIGN KEY ("team_leader_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "team_team_name_4537071e_like" ON "opx"."team" ("team_name" varchar_pattern_ops);
CREATE INDEX "team_team_description_42550e3a_like" ON "opx"."team" ("team_description" varchar_pattern_ops);
CREATE INDEX "team_team_leader_id_056b6721" ON "opx"."team" ("team_leader_id");
ALTER TABLE "opx"."territorial_dimension" ADD CONSTRAINT "territorial_dimensio_dimension_type_id_40efe9c8_fk_dimension" FOREIGN KEY ("dimension_type_id") REFERENCES "opx"."dimension_type" ("dim_type_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "territorial_dimension_dimension_name_d87bef85_like" ON "opx"."territorial_dimension" ("dimension_name" varchar_pattern_ops);
CREATE INDEX "territorial_dimension_dimension_type_id_40efe9c8" ON "opx"."territorial_dimension" ("dimension_type_id");
ALTER TABLE "opx"."team_person" ADD CONSTRAINT "team_person_person_id_ba897a4a_fk_person_pers_id" FOREIGN KEY ("person_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."team_person" ADD CONSTRAINT "team_person_team_id_6f3ebd00_fk_team_team_id" FOREIGN KEY ("team_id") REFERENCES "opx"."team" ("team_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "team_person_person_id_ba897a4a" ON "opx"."team_person" ("person_id");
CREATE INDEX "team_person_team_id_6f3ebd00" ON "opx"."team_person" ("team_id");
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_instrument_id_90e4d26d_fk_instrument_instrument_id" FOREIGN KEY ("instrument_id") REFERENCES "opx"."instrument" ("instrument_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_proj_dimension_id_0dfd46bf_fk_territori" FOREIGN KEY ("proj_dimension_id") REFERENCES "opx"."territorial_dimension" ("dimension_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_project_id_963d6354_fk_project_proj_id" FOREIGN KEY ("project_id") REFERENCES "opx"."project" ("proj_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_task_priority_id_bc5a917c_fk_task_priority_priority_id" FOREIGN KEY ("task_priority_id") REFERENCES "opx"."task_priority" ("priority_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_task_restriction_id_f353333a_fk_task_rest" FOREIGN KEY ("task_restriction_id") REFERENCES "opx"."task_restriction" ("restriction_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_task_type_id_5c87bd47_fk_task_type_task_type_id" FOREIGN KEY ("task_type_id") REFERENCES "opx"."task_type" ("task_type_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_territorial_dimensio_7285eaac_fk_territori" FOREIGN KEY ("territorial_dimension_id") REFERENCES "opx"."territorial_dimension" ("dimension_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "task_task_name_e2fe5427_like" ON "opx"."task" ("task_name" varchar_pattern_ops);
CREATE INDEX "task_instrument_id_90e4d26d" ON "opx"."task" ("instrument_id");
CREATE INDEX "task_proj_dimension_id_0dfd46bf" ON "opx"."task" ("proj_dimension_id");
CREATE INDEX "task_project_id_963d6354" ON "opx"."task" ("project_id");
CREATE INDEX "task_task_priority_id_bc5a917c" ON "opx"."task" ("task_priority_id");
CREATE INDEX "task_task_type_id_5c87bd47" ON "opx"."task" ("task_type_id");
CREATE INDEX "task_territorial_dimension_id_7285eaac" ON "opx"."task" ("territorial_dimension_id");
ALTER TABLE "opx"."survery" ADD CONSTRAINT "survery_instrument_id_70d16cb0_fk_instrument_instrument_id" FOREIGN KEY ("instrument_id") REFERENCES "opx"."instrument" ("instrument_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."survery" ADD CONSTRAINT "survery_person_id_d142ec56_fk_person_pers_id" FOREIGN KEY ("person_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."survery" ADD CONSTRAINT "survery_task_id_6c9c74c6_fk_task_task_id" FOREIGN KEY ("task_id") REFERENCES "opx"."task" ("task_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "survery_instrument_id_70d16cb0" ON "opx"."survery" ("instrument_id");
CREATE INDEX "survery_person_id_d142ec56" ON "opx"."survery" ("person_id");
CREATE INDEX "survery_task_id_6c9c74c6" ON "opx"."survery" ("task_id");
ALTER TABLE "opx"."role_permissionn" ADD CONSTRAINT "role_permissionn_permissionn_id_aebe77ae_fk_permissionn_perm_id" FOREIGN KEY ("permissionn_id") REFERENCES "opx"."permissionn" ("perm_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."role_permissionn" ADD CONSTRAINT "role_permissionn_role_id_44e516d6_fk_role_role_id" FOREIGN KEY ("role_id") REFERENCES "opx"."role" ("role_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "role_permissionn_permissionn_id_aebe77ae" ON "opx"."role_permissionn" ("permissionn_id");
CREATE INDEX "role_permissionn_role_id_44e516d6" ON "opx"."role_permissionn" ("role_id");
ALTER TABLE "opx"."project_dimension" ADD CONSTRAINT "project_dimension_project_id_42786da9_fk_project_proj_id" FOREIGN KEY ("project_id") REFERENCES "opx"."project" ("proj_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."project_dimension" ADD CONSTRAINT "project_dimension_territorial_dimensio_fda7ce3d_fk_territori" FOREIGN KEY ("territorial_dimension_id") REFERENCES "opx"."territorial_dimension" ("dimension_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "project_dimension_project_id_42786da9" ON "opx"."project_dimension" ("project_id");
CREATE INDEX "project_dimension_territorial_dimension_id_fda7ce3d" ON "opx"."project_dimension" ("territorial_dimension_id");
ALTER TABLE "opx"."project_team" ADD CONSTRAINT "project_team_project_id_df31634d_fk_project_proj_id" FOREIGN KEY ("project_id") REFERENCES "opx"."project" ("proj_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."project_team" ADD CONSTRAINT "project_team_team_id_7379054f_fk_team_team_id" FOREIGN KEY ("team_id") REFERENCES "opx"."team" ("team_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "project_team_project_id_df31634d" ON "opx"."project_team" ("project_id");
CREATE INDEX "project_team_team_id_7379054f" ON "opx"."project_team" ("team_id");
ALTER TABLE "opx"."project_decision" ADD CONSTRAINT "project_decision_decision_id_ae45218f_fk_decision_decs_id" FOREIGN KEY ("decision_id") REFERENCES "opx"."decision" ("decs_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."project_decision" ADD CONSTRAINT "project_decision_project_id_bd05faad_fk_project_proj_id" FOREIGN KEY ("project_id") REFERENCES "opx"."project" ("proj_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "project_decision_decision_id_ae45218f" ON "opx"."project_decision" ("decision_id");
CREATE INDEX "project_decision_project_id_bd05faad" ON "opx"."project_decision" ("project_id");
ALTER TABLE "opx"."project_context" ADD CONSTRAINT "project_context_context_id_2b071d9d_fk_context_context_id" FOREIGN KEY ("context_id") REFERENCES "opx"."context" ("context_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."project_context" ADD CONSTRAINT "project_context_project_id_60230bed_fk_project_proj_id" FOREIGN KEY ("project_id") REFERENCES "opx"."project" ("proj_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "project_context_context_id_2b071d9d" ON "opx"."project_context" ("context_id");
CREATE INDEX "project_context_project_id_60230bed" ON "opx"."project_context" ("project_id");
CREATE INDEX "project_project_type_id_44f37a37" ON "opx"."project" ("project_type_id");
ALTER TABLE "opx"."project" ADD CONSTRAINT "project_project_type_id_44f37a37_fk_project_type_projtype_id" FOREIGN KEY ("project_type_id") REFERENCES "opx"."project_type" ("projtype_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."person_task" ADD CONSTRAINT "person_task_person_id_511c9cd8_fk_person_pers_id" FOREIGN KEY ("person_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."person_task" ADD CONSTRAINT "person_task_task_id_de763daa_fk_task_task_id" FOREIGN KEY ("task_id") REFERENCES "opx"."task" ("task_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "person_task_person_id_511c9cd8" ON "opx"."person_task" ("person_id");
CREATE INDEX "person_task_task_id_de763daa" ON "opx"."person_task" ("task_id");
CREATE INDEX "person_role_id_6e825b23" ON "opx"."person" ("role_id");
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_role_id_6e825b23_fk_role_role_id" FOREIGN KEY ("role_id") REFERENCES "opx"."role" ("role_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_user_id_1e34abe8_fk_user_userid" FOREIGN KEY ("user_id") REFERENCES "opx"."user" ("userid") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."peace_schedule" ADD CONSTRAINT "peace_schedule_peace_initiative_id_fc37891c_fk_peace_ini" FOREIGN KEY ("peace_initiative_id") REFERENCES "opx"."peace_initiative" ("peace_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "peace_schedule_peace_initiative_id_fc37891c" ON "opx"."peace_schedule" ("peace_initiative_id");
CREATE INDEX "peace_initiative_person_id_5f3c6adb" ON "opx"."peace_initiative" ("person_id");
ALTER TABLE "opx"."peace_initiative" ADD CONSTRAINT "peace_initiative_person_id_5f3c6adb_fk_person_pers_id" FOREIGN KEY ("person_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."notification" ADD CONSTRAINT "notification_person_id_669c895d_fk_person_pers_id" FOREIGN KEY ("person_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "notification_person_id_669c895d" ON "opx"."notification" ("person_id");
ALTER TABLE "opx"."data_context" ADD CONSTRAINT "data_context_context_id_2c985f34_fk_context_context_id" FOREIGN KEY ("context_id") REFERENCES "opx"."context" ("context_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "data_context_context_id_2c985f34" ON "opx"."data_context" ("context_id");
ALTER TABLE "opx"."contextualization" ADD CONSTRAINT "contextualization_conflict_id_898890ae_fk_conflict_conflict_id" FOREIGN KEY ("conflict_id") REFERENCES "opx"."conflict" ("conflict_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."contextualization" ADD CONSTRAINT "contextualization_education_level_id_6c2977f4_fk_education" FOREIGN KEY ("education_level_id") REFERENCES "opx"."education_level" ("educlevel_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."contextualization" ADD CONSTRAINT "contextualization_gender_id_73ceb151_fk_gender_gender_id" FOREIGN KEY ("gender_id") REFERENCES "opx"."gender" ("gender_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."contextualization" ADD CONSTRAINT "contextualization_neighborhood_id_2db2be71_fk_neighborh" FOREIGN KEY ("neighborhood_id") REFERENCES "opx"."neighborhood" ("neighb_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "contextualization_conflict_id_898890ae" ON "opx"."contextualization" ("conflict_id");
CREATE INDEX "contextualization_education_level_id_6c2977f4" ON "opx"."contextualization" ("education_level_id");
CREATE INDEX "contextualization_gender_id_73ceb151" ON "opx"."contextualization" ("gender_id");
CREATE INDEX "contextualization_neighborhood_id_2db2be71" ON "opx"."contextualization" ("neighborhood_id");
ALTER TABLE "opx"."comment" ADD CONSTRAINT "comment_project_id_12f13dc4_fk_project_proj_id" FOREIGN KEY ("project_id") REFERENCES "opx"."project" ("proj_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "comment_project_id_12f13dc4" ON "opx"."comment" ("project_id");
ALTER TABLE "opx"."cartography" ADD CONSTRAINT "cartography_instrument_id_b9d44345_fk_instrument_instrument_id" FOREIGN KEY ("instrument_id") REFERENCES "opx"."instrument" ("instrument_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."cartography" ADD CONSTRAINT "cartography_osm_elemtent_id_38033fe3_fk_osm_eleme" FOREIGN KEY ("osm_elemtent_id") REFERENCES "opx"."osm_element" ("osmelement_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."cartography" ADD CONSTRAINT "cartography_person_id_523b21bd_fk_person_pers_id" FOREIGN KEY ("person_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."cartography" ADD CONSTRAINT "cartography_task_id_08f2958a_fk_task_task_id" FOREIGN KEY ("task_id") REFERENCES "opx"."task" ("task_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "cartography_instrument_id_b9d44345" ON "opx"."cartography" ("instrument_id");
CREATE INDEX "cartography_osm_elemtent_id_38033fe3" ON "opx"."cartography" ("osm_elemtent_id");
CREATE INDEX "cartography_person_id_523b21bd" ON "opx"."cartography" ("person_id");
CREATE INDEX "cartography_task_id_08f2958a" ON "opx"."cartography" ("task_id");
COMMIT;
