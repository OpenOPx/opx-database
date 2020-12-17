BEGIN;
-- DROP SCHEMA opx ;
CREATE SCHEMA opx AUTHORIZATION opxuser;
--
-- Create model User
--
CREATE TABLE "opx"."user" ("last_login" timestamp with time zone NULL, "userid" uuid NOT NULL PRIMARY KEY, "useremail" varchar(100) NOT NULL UNIQUE, "password" varchar(255) NOT NULL, "usertoken" varchar(255) NULL);
--
-- Create model Comment
--
CREATE TABLE "opx"."comment" ("comment_id" uuid NOT NULL PRIMARY KEY, "comment_title" varchar(100) NOT NULL, "comment_description" varchar(500) NOT NULL, "comment_date" timestamp with time zone NOT NULL);
--
-- Create model Context
--
CREATE TABLE "opx"."context" ("context_id" uuid NOT NULL PRIMARY KEY, "context_description" varchar(500) NOT NULL);
--
-- Create model Decision
--
CREATE TABLE "opx"."decision" ("decs_id" uuid NOT NULL PRIMARY KEY, "decs_name" varchar(100) NOT NULL, "decs_description" varchar(500) NOT NULL);
--
-- Create model EducationLevel
--
CREATE TABLE "opx"."education_level" ("educlevel_id" uuid NOT NULL PRIMARY KEY, "educlevel_name" varchar(100) NOT NULL, "isactive" integer NOT NULL);
--
-- Create model Gender
--
CREATE TABLE "opx"."gender" ("gender_id" uuid NOT NULL PRIMARY KEY, "gender_name" varchar(100) NOT NULL, "isactive" integer NOT NULL);
--
-- Create model Neighborhood
--
CREATE TABLE "opx"."neighborhood" ("neighb_id" integer NOT NULL PRIMARY KEY, "neighb_name" varchar(100) NOT NULL, "city_code" integer NOT NULL);
--
-- Create model Params
--
CREATE TABLE "opx"."params" ("params_id" uuid NOT NULL PRIMARY KEY, "params_value" varchar(100) NOT NULL, "params_description" varchar(500) NOT NULL);
--
-- Create model PeaceInitiative
--
CREATE TABLE "opx"."peace_initiative" ("peace_id" uuid NOT NULL PRIMARY KEY, "peace_name" varchar(100) NOT NULL, "peace_description" varchar(500) NOT NULL, "peace_geojson" jsonb NOT NULL);
--
-- Create model PeaceSchedule
--
CREATE TABLE "opx"."peace_schedule" ("peace_shc_id" uuid NOT NULL PRIMARY KEY, "peace_shc_day" varchar(50) NOT NULL, "peace_shc_time" time NULL);
--
-- Create model Permissionn
--
CREATE TABLE "opx"."permissionn" ("perm_id" uuid NOT NULL PRIMARY KEY, "perm_codename" varchar(100) NOT NULL, "perm_name" varchar(255) NOT NULL, "perm_description" varchar(500) NOT NULL);
--
-- Create model Person
--
CREATE TABLE "opx"."person" ("pers_id" uuid NOT NULL PRIMARY KEY, "pers_name" varchar(255) NOT NULL, "pers_lastname" varchar(355) NOT NULL, "pers_birthdate" date NOT NULL, "pers_telephone" varchar(20) NOT NULL, "pers_latitude" varchar(30) NULL, "pers_longitude" varchar(30) NULL, "hour_location" varchar(100) NULL, "pers_score" integer NULL, "pers_creation_date" timestamp with time zone NOT NULL, "isactive" integer NOT NULL, "isemployee" integer NOT NULL, "education_level_id" uuid NOT NULL, "gender_id" uuid NOT NULL, "neighborhood_id" integer NOT NULL);
--
-- Create model Project
--
CREATE TABLE "opx"."project" ("proj_id" uuid NOT NULL PRIMARY KEY, "proj_name" varchar(100) NOT NULL, "proj_description" varchar(500) NOT NULL, "proj_external_id" varchar(500) NOT NULL, "proj_creation_date" timestamp with time zone NOT NULL, "proj_close_date" timestamp with time zone NULL, "proj_start_date" timestamp with time zone NULL, "proj_completness" double precision NOT NULL, "isactive" integer NOT NULL, "proj_owner_id" uuid NOT NULL);
--
-- Create model ProjectType
--
CREATE TABLE "opx"."project_type" ("projtype_id" uuid NOT NULL PRIMARY KEY, "projtype_name" varchar(100) NOT NULL, "projtype_description" varchar(500) NOT NULL);
--
-- Create model Role
--
CREATE TABLE "opx"."role" ("role_id" uuid NOT NULL PRIMARY KEY, "role_name" varchar(50) NOT NULL, "role_description" varchar(255) NOT NULL, "isactive" integer NOT NULL);
--
-- Create model Task
--
CREATE TABLE "opx"."task" ("task_id" uuid NOT NULL PRIMARY KEY, "task_name" varchar(100) NOT NULL, "task_description" varchar(300) NOT NULL, "task_observation" varchar(1000) NOT NULL, "task_creation_date" timestamp with time zone NOT NULL, "task_completness" double precision NOT NULL, "isactive" integer NOT NULL);
--
-- Create model TaskPriority
--
CREATE TABLE "opx"."task_priority" ("priority_id" uuid NOT NULL PRIMARY KEY, "priority_name" varchar(100) NOT NULL, "priority_number" integer NOT NULL);
--
-- Create model TaskType
--
CREATE TABLE "opx"."task_type" ("task_type_id" uuid NOT NULL PRIMARY KEY, "task_type_name" varchar(100) NOT NULL, "task_type_description" varchar(300) NOT NULL);
--
-- Create model Team
--
CREATE TABLE "opx"."team" ("team_id" uuid NOT NULL PRIMARY KEY, "team_name" varchar(100) NOT NULL, "team_leader_id" uuid NOT NULL);
--
-- Create model TerritorialDimension
--
CREATE TABLE "opx"."territorial_dimension" ("dimension_id" uuid NOT NULL PRIMARY KEY, "dimension_name" varchar(100) NOT NULL, "dimension_geojson" jsonb NOT NULL, "is_preloaded" integer NOT NULL, "isactive" integer NOT NULL, "preloaded" integer NOT NULL);
--
-- Create model TeamPerson
--
CREATE TABLE "opx"."team_person" ("id" serial NOT NULL PRIMARY KEY, "participation" double precision NOT NULL, "person_id" uuid NOT NULL, "team_id" uuid NOT NULL);
--
-- Create model TaskRestriction
--
CREATE TABLE "opx"."task_restriction" ("restriction_id" uuid NOT NULL PRIMARY KEY, "start_time" time NULL, "end_time" time NULL, "task_date" date NULL, "task_start_date" date NULL, "task_end_date" date NULL, "task_id" uuid NOT NULL);
--
-- Add field task_priority to task
--
ALTER TABLE "opx"."task" ADD COLUMN "task_priority_id" uuid NOT NULL;
--
-- Add field task_type to task
--
ALTER TABLE "opx"."task" ADD COLUMN "task_type_id" uuid NOT NULL;
--
-- Add field territorial_dimension to task
--
ALTER TABLE "opx"."task" ADD COLUMN "territorial_dimension_id" uuid NOT NULL;
--
-- Create model RolePermissionn
--
CREATE TABLE "opx"."role_permissionn" ("role_permissionn_id" uuid NOT NULL PRIMARY KEY, "permissionn_id" uuid NOT NULL, "role_id" uuid NOT NULL);
--
-- Create model ProjectTerritorialDimension
--
CREATE TABLE "opx"."project_dimension" ("proj_dimension_id" uuid NOT NULL PRIMARY KEY, "project_id" uuid NOT NULL, "territorial_dimension_id" uuid NOT NULL);
--
-- Create model ProjectTeam
--
CREATE TABLE "opx"."project_team" ("id" serial NOT NULL PRIMARY KEY, "project_id" uuid NOT NULL, "team_id" uuid NOT NULL);
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
-- Create model DataContext
--
CREATE TABLE "opx"."data_context" ("data_id" uuid NOT NULL PRIMARY KEY, "hdxtag" varchar(100) NOT NULL, "data_value" varchar(100) NOT NULL, "data_type" varchar(100) NOT NULL, "data_description" varchar(500) NOT NULL, "data_geojson" varchar(3000) NOT NULL, "data_date" date NULL, "data_time" time NULL, "context_id" uuid NOT NULL);
CREATE INDEX "user_useremail_acadcdba_like" ON "opx"."user" ("useremail" varchar_pattern_ops);
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_education_level_id_cc1d15f2_fk_education" FOREIGN KEY ("education_level_id") REFERENCES "opx"."education_level" ("educlevel_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_gender_id_59f5af71_fk_gender_gender_id" FOREIGN KEY ("gender_id") REFERENCES "opx"."gender" ("gender_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."person" ADD CONSTRAINT "person_neighborhood_id_427121f5_fk_neighborhood_neighb_id" FOREIGN KEY ("neighborhood_id") REFERENCES "opx"."neighborhood" ("neighb_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "person_education_level_id_cc1d15f2" ON "opx"."person" ("education_level_id");
CREATE INDEX "person_gender_id_59f5af71" ON "opx"."person" ("gender_id");
CREATE INDEX "person_neighborhood_id_427121f5" ON "opx"."person" ("neighborhood_id");
ALTER TABLE "opx"."project" ADD CONSTRAINT "project_proj_owner_id_639c5da3_fk_person_pers_id" FOREIGN KEY ("proj_owner_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "project_proj_owner_id_639c5da3" ON "opx"."project" ("proj_owner_id");
ALTER TABLE "opx"."team" ADD CONSTRAINT "team_team_leader_id_056b6721_fk_person_pers_id" FOREIGN KEY ("team_leader_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "team_team_leader_id_056b6721" ON "opx"."team" ("team_leader_id");
ALTER TABLE "opx"."team_person" ADD CONSTRAINT "team_person_person_id_ba897a4a_fk_person_pers_id" FOREIGN KEY ("person_id") REFERENCES "opx"."person" ("pers_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "opx"."team_person" ADD CONSTRAINT "team_person_team_id_6f3ebd00_fk_team_team_id" FOREIGN KEY ("team_id") REFERENCES "opx"."team" ("team_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "team_person_person_id_ba897a4a" ON "opx"."team_person" ("person_id");
CREATE INDEX "team_person_team_id_6f3ebd00" ON "opx"."team_person" ("team_id");
ALTER TABLE "opx"."task_restriction" ADD CONSTRAINT "task_restriction_task_id_69a89849_fk_task_task_id" FOREIGN KEY ("task_id") REFERENCES "opx"."task" ("task_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "task_restriction_task_id_69a89849" ON "opx"."task_restriction" ("task_id");
CREATE INDEX "task_task_priority_id_bc5a917c" ON "opx"."task" ("task_priority_id");
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_task_priority_id_bc5a917c_fk_task_priority_priority_id" FOREIGN KEY ("task_priority_id") REFERENCES "opx"."task_priority" ("priority_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "task_task_type_id_5c87bd47" ON "opx"."task" ("task_type_id");
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_task_type_id_5c87bd47_fk_task_type_task_type_id" FOREIGN KEY ("task_type_id") REFERENCES "opx"."task_type" ("task_type_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "task_territorial_dimension_id_7285eaac" ON "opx"."task" ("territorial_dimension_id");
ALTER TABLE "opx"."task" ADD CONSTRAINT "task_territorial_dimensio_7285eaac_fk_territori" FOREIGN KEY ("territorial_dimension_id") REFERENCES "opx"."territorial_dimension" ("dimension_id") DEFERRABLE INITIALLY DEFERRED;
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
ALTER TABLE "opx"."data_context" ADD CONSTRAINT "data_context_context_id_2c985f34_fk_context_context_id" FOREIGN KEY ("context_id") REFERENCES "opx"."context" ("context_id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "data_context_context_id_2c985f34" ON "opx"."data_context" ("context_id");
COMMIT;
