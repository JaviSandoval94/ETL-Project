CREATE TABLE "measurements" (
    "site_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "category_id" INT   NOT NULL,
    "energy_kWh" FLOAT   NOT NULL,
    CONSTRAINT "pk_measurements" PRIMARY KEY (
        "site_id","date","category_id"
     )
);

CREATE TABLE "categories" (
    "category_id" INT   NOT NULL,
    "category_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "meteorological" (
    "region_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "avg_temp" FLOAT   NOT NULL,
    "humidity" FLOAT   NOT NULL,
    "f_like" FLOAT   NOT NULL,
    CONSTRAINT "pk_meteorological" PRIMARY KEY (
        "region_id","date"
     )
);

CREATE TABLE "sales" (
    "site_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "sales" FLOAT   NOT NULL,
    "customers" FLOAT   NOT NULL,
    CONSTRAINT "pk_sales" PRIMARY KEY (
        "site_id","date"
     )
);

CREATE TABLE "sites" (
    "site_id" INT   NOT NULL,
    "site_name" VARCHAR   NOT NULL,
    "region_id" INT   NOT NULL,
    CONSTRAINT "pk_sites" PRIMARY KEY (
        "site_id"
     )
);

CREATE TABLE "region" (
    "region_id" INT   NOT NULL,
    "region_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "region_id"
     )
);

ALTER TABLE "measurements" ADD CONSTRAINT "fk_measurements_site_id" FOREIGN KEY("site_id")
REFERENCES "sites" ("site_id");

ALTER TABLE "measurements" ADD CONSTRAINT "fk_measurements_category_id" FOREIGN KEY("category_id")
REFERENCES "categories" ("category_id");

ALTER TABLE "meteorological" ADD CONSTRAINT "fk_meteorological_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_site_id" FOREIGN KEY("site_id")
REFERENCES "sites" ("site_id");

ALTER TABLE "sites" ADD CONSTRAINT "fk_sites_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

SELECT * FROM categories

SELECT * FROM measurements

SELECT * FROM meteorological

SELECT * FROM region

SELECT * FROM sites

SELECT * FROM sales
