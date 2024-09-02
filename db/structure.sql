CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "plugins" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "published" boolean, "major" integer, "minor" integer, "patch" integer, "status" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "plugin_releases" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "code_name" varchar, "major" integer, "minor" integer, "patch" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "plugin_id" integer NOT NULL, CONSTRAINT "fk_rails_cffb6da6e4"
FOREIGN KEY ("plugin_id")
  REFERENCES "plugins" ("id")
);
CREATE INDEX "index_plugin_releases_on_plugin_id" ON "plugin_releases" ("plugin_id");
INSERT INTO "schema_migrations" (version) VALUES
('20240822094318'),
('20240822093012'),
('20240821085216');

