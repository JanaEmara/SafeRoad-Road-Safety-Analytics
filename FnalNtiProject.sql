CREATE DATABASE saferoad;
USE saferoad;

DROP TABLE IF EXISTS collisions_raw;
CREATE TABLE collisions_raw (
    collision_index VARCHAR(20),
    collision_year INT,
    collision_ref_no VARCHAR(20),
    location_easting_osgr INT,
    location_northing_osgr INT,
    longitude DECIMAL(10,6),
    latitude DECIMAL(10,6),
    police_force INT,
    collision_severity INT,
    number_of_vehicles INT,
    number_of_casualties INT,
    date VARCHAR(20),
    day_of_week INT,
    time VARCHAR(10),
    local_authority_district INT,
    local_authority_ons_district VARCHAR(20),
    local_authority_highway VARCHAR(20),
    local_authority_highway_current VARCHAR(20),
    first_road_class INT,
    first_road_number INT,
    road_type INT,
    speed_limit INT,
    junction_detail_historic INT,
    junction_detail INT,
    junction_control INT,
    second_road_class INT,
    second_road_number INT,
    pedestrian_crossing_human_control_historic INT,
    pedestrian_crossing_physical_facilities_historic INT,
    pedestrian_crossing INT,
    light_conditions INT,
    weather_conditions INT,
    road_surface_conditions INT,
    special_conditions_at_site INT,
    carriageway_hazards_historic INT,
    carriageway_hazards INT,
    urban_or_rural_area INT,
    did_police_officer_attend_scene_of_accident INT,
    trunk_road_flag INT,
    lsoa_of_accident_location VARCHAR(20),
    enhanced_severity_collision INT,
    collision_injury_based INT,
    collision_adjusted_severity_serious INT,
    collision_adjusted_severity_slight INT
);

CREATE TABLE vehicles_raw (
    collision_index VARCHAR(20),
    collision_year INT,
    collision_ref_no VARCHAR(20),
    vehicle_reference INT,
    vehicle_type INT,
    towing_and_articulation INT,
    vehicle_manoeuvre_historic INT,
    vehicle_manoeuvre INT,
    vehicle_direction_from INT,
    vehicle_direction_to INT,
    vehicle_location_restricted_lane_historic INT,
    vehicle_location_restricted_lane INT,
    junction_location INT,
    skidding_and_overturning INT,
    hit_object_in_carriageway INT,
    vehicle_leaving_carriageway INT,
    hit_object_off_carriageway INT,
    first_point_of_impact INT,
    vehicle_left_hand_drive INT,
    journey_purpose_of_driver_historic INT,
    journey_purpose_of_driver INT,
    sex_of_driver INT,
    age_of_driver INT,
    age_band_of_driver INT,
    engine_capacity_cc INT,
    propulsion_code INT,
    age_of_vehicle INT,
    generic_make_model VARCHAR(100),
    driver_imd_decile INT,
    lsoa_of_driver VARCHAR(20),
    escooter_flag INT,
    driver_distance_banding INT
);

CREATE TABLE casualties_raw (
    collision_index VARCHAR(20),
    collision_year INT,
    collision_ref_no VARCHAR(20),
    vehicle_reference INT,
    casualty_reference INT,
    casualty_class INT,
    sex_of_casualty INT,
    age_of_casualty INT,
    age_band_of_casualty INT,
    casualty_severity INT,
    pedestrian_location INT,
    pedestrian_movement INT,
    car_passenger INT,
    bus_or_coach_passenger INT,
    pedestrian_road_maintenance_worker INT,
    casualty_type INT,
    casualty_imd_decile INT,
    lsoa_of_casualty VARCHAR(20),
    enhanced_casualty_severity INT,
    casualty_injury_based INT,
    casualty_adjusted_severity_serious INT,
    casualty_adjusted_severity_slight INT,
    casualty_distance_banding INT
);

SHOW COLUMNS FROM collisions_raw;

SHOW TABLES;

USE saferoad;

TRUNCATE TABLE collisions_raw;

SELECT COUNT(*) AS total_collisions
FROM collisions_raw;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dft-road-casualty-statistics-collision-2025.csv'
INTO TABLE collisions_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_collisions
FROM collisions_raw;

USE saferoad;

TRUNCATE TABLE collisions_raw;
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dft-road-casualty-statistics-collision-2025.csv'
INTO TABLE collisions_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    collision_index,
    collision_year,
    collision_ref_no,
    @location_easting_osgr,
    @location_northing_osgr,
    @longitude,
    @latitude,
    police_force,
    collision_severity,
    number_of_vehicles,
    number_of_casualties,
    date,
    day_of_week,
    time,
    local_authority_district,
    local_authority_ons_district,
    local_authority_highway,
    local_authority_highway_current,
    first_road_class,
    first_road_number,
    road_type,
    speed_limit,
    junction_detail_historic,
    junction_detail,
    junction_control,
    second_road_class,
    second_road_number,
    pedestrian_crossing_human_control_historic,
    pedestrian_crossing_physical_facilities_historic,
    pedestrian_crossing,
    light_conditions,
    weather_conditions,
    road_surface_conditions,
    special_conditions_at_site,
    carriageway_hazards_historic,
    carriageway_hazards,
    urban_or_rural_area,
    did_police_officer_attend_scene_of_accident,
    trunk_road_flag,
    lsoa_of_accident_location,
    enhanced_severity_collision,
    collision_injury_based,
    collision_adjusted_severity_serious,
    collision_adjusted_severity_slight
)
SET
    location_easting_osgr = NULLIF(@location_easting_osgr, ''),
    location_northing_osgr = NULLIF(@location_northing_osgr, ''),
    longitude = NULLIF(@longitude, ''),
    latitude = NULLIF(@latitude, '');
    
SELECT COUNT(*) AS total_collisions
FROM collisions_raw;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dft-road-casualty-statistics-vehicle-2025.csv'
INTO TABLE vehicles_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_vehicles
FROM vehicles_raw;

USE saferoad;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dft-road-casualty-statistics-casualty-2025.csv'
INTO TABLE casualties_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_casualties
FROM casualties_raw;

SELECT *
FROM collisions_raw
LIMIT 10;

SELECT *
FROM vehicles_raw
LIMIT 10;

SELECT *
FROM casualties_raw
LIMIT 10;

-- investigate severe accidents We know: 1 = Fatal, 2 = Serious, 3 = Slight So let's look at fatal collisions
SELECT
    collision_index,
    collision_severity,
    number_of_vehicles,
    number_of_casualties,
    date,
    time,
    road_type,
    speed_limit,
    light_conditions,
    weather_conditions,
    road_surface_conditions,
    urban_or_rural_area
FROM collisions_raw
WHERE collision_severity = 1
LIMIT 20;

-- Severity distribution
SELECT
    collision_severity,
    COUNT(*) AS collision_count
FROM collisions_raw
GROUP BY collision_severity
ORDER BY collision_count DESC;

-- Accidents by road type
SELECT
    road_type,
    COUNT(*) AS collision_count
FROM collisions_raw
GROUP BY road_type
ORDER BY collision_count DESC;

-- Accidents by speed limit
SELECT
    speed_limit,
    COUNT(*) AS collision_count
FROM collisions_raw
GROUP BY speed_limit
ORDER BY collision_count DESC;

-- Accidents by weather
SELECT
    weather_conditions,
    COUNT(*) AS collision_count
FROM collisions_raw
GROUP BY weather_conditions
ORDER BY collision_count DESC;

-- Accidents by urban/rural area
SELECT
    urban_or_rural_area,
    COUNT(*) AS collision_count
FROM collisions_raw
GROUP BY urban_or_rural_area
ORDER BY collision_count DESC;

SELECT
    c.collision_index,
    c.collision_severity,
    c.date,
    c.time,
    c.road_type,
    v.vehicle_reference,
    v.vehicle_type,
    v.age_of_driver,
    v.sex_of_driver
FROM collisions_raw AS c
JOIN vehicles_raw AS v
    ON c.collision_index = v.collision_index
LIMIT 20;

SELECT
    c.collision_index,
    c.collision_severity,
    COUNT(v.vehicle_reference) AS vehicle_count
FROM collisions_raw AS c
LEFT JOIN vehicles_raw AS v
    ON c.collision_index = v.collision_index
GROUP BY
    c.collision_index,
    c.collision_severity
ORDER BY vehicle_count DESC
LIMIT 20;

SELECT
    c.collision_index,
    c.collision_severity,
    COUNT(cas.casualty_reference) AS casualty_count
FROM collisions_raw AS c
LEFT JOIN casualties_raw AS cas
    ON c.collision_index = cas.collision_index
GROUP BY
    c.collision_index,
    c.collision_severity
ORDER BY casualty_count DESC
LIMIT 20;

-- Write one clear query that pulls the columns and rows your analysis actually needs — filter out obvious junk here.


USE saferoad;

-- The vehicles_raw table has multiple rows for the same collision
-- because one collision can involve multiple vehicles.
--
-- We summarize the vehicle-level data so that we get:
-- ONE ROW PER COLLISION
--
-- This prevents row multiplication when we later JOIN the tables.

-- ============================================================
-- STEP 1: CREATE A VEHICLE SUMMARY
-- ============================================================
-- The vehicles_raw table has multiple rows for the same collision
-- because one collision can involve multiple vehicles.
--
-- We summarize the vehicle-level data so that we get:
-- ONE ROW PER COLLISION
--
-- This prevents row multiplication when we later JOIN the tables.

CREATE TEMPORARY TABLE vehicle_summary AS

SELECT
    collision_index,

    -- Count how many vehicles were involved in each collision
    COUNT(*) AS vehicle_count,

    -- Calculate the average driver age for each collision.
    -- -1 represents missing/unavailable age, so we convert it to NULL.
    -- AVG() ignores NULL values.
    -- ROUND(..., 1) keeps one decimal place.
    ROUND(
        AVG(NULLIF(age_of_driver, -1)),
        1
    ) AS avg_driver_age

FROM vehicles_raw

-- Group all vehicle records belonging to the same collision
GROUP BY collision_index;



-- ============================================================
-- STEP 2: CREATE A CASUALTY SUMMARY
-- ============================================================
-- The casualties_raw table can contain multiple casualties
-- for the same collision.
--
-- Again, we summarize the data to get:
-- ONE ROW PER COLLISION
--
-- This allows us to safely join casualty information
-- to the collision-level data.

CREATE TEMPORARY TABLE casualty_summary AS

SELECT
    collision_index,

    -- Total number of casualties in each collision
    COUNT(*) AS casualty_count,

    -- Count fatal casualties
    -- casualty_severity = 1 means Fatal
    SUM(
        CASE
            WHEN casualty_severity = 1 THEN 1
            ELSE 0
        END
    ) AS fatal_casualties,

    -- Count serious casualties
    -- casualty_severity = 2 means Serious
    SUM(
        CASE
            WHEN casualty_severity = 2 THEN 1
            ELSE 0
        END
    ) AS serious_casualties,

    -- Count slight casualties
    -- casualty_severity = 3 means Slight
    SUM(
        CASE
            WHEN casualty_severity = 3 THEN 1
            ELSE 0
        END
    ) AS slight_casualties

FROM casualties_raw

-- Group all casualty records belonging to the same collision
GROUP BY collision_index;



-- ============================================================
-- STEP 3: VALIDATE THE SUMMARY TABLES
-- ============================================================
-- These checks make sure that the temporary summary tables
-- were created successfully and contain data.

SELECT
    COUNT(*) AS vehicle_summary_rows
FROM vehicle_summary;


SELECT
    COUNT(*) AS casualty_summary_rows
FROM casualty_summary;



-- ============================================================
-- STEP 4: FINAL ANALYSIS QUERY
-- ============================================================
-- This query creates the dataset that will be exported
-- to query_result.csv and used later in Python.
--
-- The goal is:
-- ONE ROW = ONE COLLISION
--
-- We select only the variables that are relevant to our
-- SafeRoad analysis instead of taking every raw column.


SELECT

    -- --------------------------------------------------------
    -- COLLISION IDENTIFICATION & SEVERITY
    -- --------------------------------------------------------

    c.collision_index,
    c.collision_year,

    -- Collision severity:
    -- 1 = Fatal
    -- 2 = Serious
    -- 3 = Slight
    c.collision_severity,


    -- --------------------------------------------------------
    -- TIME VARIABLES
    -- --------------------------------------------------------
    -- These allow us to analyze WHEN accidents happen.

    c.date,
    c.day_of_week,
    c.time,


    -- --------------------------------------------------------
    -- LOCATION VARIABLES
    -- --------------------------------------------------------
    -- Longitude and latitude can later be used for mapping
    -- in Power BI and Tableau.

    c.longitude,
    c.latitude,


    -- --------------------------------------------------------
    -- ROAD & JUNCTION INFORMATION
    -- --------------------------------------------------------
    -- These variables help us investigate whether road
    -- characteristics are associated with accident severity.

    c.road_type,
    c.speed_limit,
    c.first_road_class,
    c.junction_detail,
    c.junction_control,


    -- --------------------------------------------------------
    -- ENVIRONMENT & ROAD CONDITIONS
    -- --------------------------------------------------------
    -- These variables allow us to investigate the conditions
    -- surrounding collisions.

    c.light_conditions,
    c.weather_conditions,
    c.road_surface_conditions,
    c.special_conditions_at_site,
    c.carriageway_hazards,


    -- --------------------------------------------------------
    -- AREA / ROAD CLASSIFICATION
    -- --------------------------------------------------------

    c.urban_or_rural_area,
    c.trunk_road_flag,


    -- --------------------------------------------------------
    -- ORIGINAL COLLISION COUNTS
    -- --------------------------------------------------------
    -- These values come directly from the collision table.

    c.number_of_vehicles,
    c.number_of_casualties,


    -- --------------------------------------------------------
    -- VEHICLE SUMMARY
    -- --------------------------------------------------------
    -- These values were calculated from vehicles_raw.
    --
    -- Because vehicle_summary contains ONE ROW PER COLLISION,
    -- joining it does not multiply the collision rows.

    v.vehicle_count,
    v.avg_driver_age,


    -- --------------------------------------------------------
    -- CASUALTY SUMMARY
    -- --------------------------------------------------------
    -- These values were calculated from casualties_raw.
    --
    -- They give us a breakdown of casualty severity
    -- for each collision.

    ca.casualty_count,
    ca.fatal_casualties,
    ca.serious_casualties,
    ca.slight_casualties


-- ------------------------------------------------------------
-- MAIN TABLE
-- ------------------------------------------------------------
-- collisions_raw is our main table because:
-- ONE ROW = ONE COLLISION.

FROM collisions_raw AS c


-- ------------------------------------------------------------
-- JOIN VEHICLE SUMMARY
-- ------------------------------------------------------------
-- LEFT JOIN keeps the collision even if vehicle summary
-- information is unavailable.

LEFT JOIN vehicle_summary AS v
    ON c.collision_index = v.collision_index


-- ------------------------------------------------------------
-- JOIN CASUALTY SUMMARY
-- ------------------------------------------------------------
-- Again, LEFT JOIN keeps the collision-level record.

LEFT JOIN casualty_summary AS ca
    ON c.collision_index = ca.collision_index


-- ------------------------------------------------------------
-- FILTER OUT INVALID / UNUSABLE COLLISION RECORDS
-- ------------------------------------------------------------
-- Make sure the collision has a valid ID.
--
-- Also keep only the three valid collision severity categories:
-- 1 = Fatal
-- 2 = Serious
-- 3 = Slight.

WHERE c.collision_index IS NOT NULL
  AND c.collision_severity IN (1, 2, 3);