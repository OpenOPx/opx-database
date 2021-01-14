--
-- Create model FCMDevice
--
CREATE TABLE "fcm_django_fcmdevice" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(255) NULL, "active" boolean NOT NULL, "date_created" timestamp with time zone NULL, "device_id" uuid NULL, "registration_id" text NOT NULL, "type" varchar(10) NOT NULL, "user_id" uuid NULL);
ALTER TABLE "fcm_django_fcmdevice" ADD CONSTRAINT "fcm_django_fcmdevice_user_id_6cdfc0a2_fk_user_userid" FOREIGN KEY ("user_id") REFERENCES "opx"."user" ("userid") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "fcm_django_fcmdevice_device_id_a9406c36" ON "fcm_django_fcmdevice" ("device_id");
CREATE INDEX "fcm_django_fcmdevice_user_id_6cdfc0a2" ON "fcm_django_fcmdevice" ("user_id");

--
-- Alter field device_id on fcmdevice
--
ALTER TABLE "fcm_django_fcmdevice" ALTER COLUMN "device_id" TYPE varchar(150) USING "device_id"::varchar(150);

--
-- Alter field user on fcmdevice
--
SET CONSTRAINTS "fcm_django_fcmdevice_user_id_6cdfc0a2_fk_user_userid" IMMEDIATE; ALTER TABLE "fcm_django_fcmdevice" DROP CONSTRAINT "fcm_django_fcmdevice_user_id_6cdfc0a2_fk_user_userid";
ALTER TABLE "fcm_django_fcmdevice" ADD CONSTRAINT "fcm_django_fcmdevice_user_id_6cdfc0a2_fk_user_userid" FOREIGN KEY ("user_id") REFERENCES "opx"."user" ("userid") DEFERRABLE INITIALLY DEFERRED;
COMMIT;