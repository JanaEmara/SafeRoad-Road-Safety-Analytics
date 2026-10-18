# SafeRoad: Road Accident Severity & Risk Intelligence

## Project Overview

SafeRoad is an end-to-end data analytics project focused on understanding where, when, and under what conditions road collisions are more likely to be severe.

Using road safety data from the UK Department for Transport, this project explores collision severity and examines patterns related to time, location, road conditions, weather, drivers, and vehicles.

The goal is to transform raw data into meaningful insights that can support better understanding of road safety risks.

## Business Questions

- When are severe road collisions more common?
- How does collision severity differ between urban and rural areas?
- What patterns appear across road types, lighting, and weather conditions?
- How does severity vary across driver age groups?
- What insights can help guide road safety recommendations?

## Dataset

Source: https://www.gov.uk/government/statistical-data-sets/road-safety-open-data

The project uses three related datasets:

- **Collisions:** 101,525 records
- **Vehicles:** 183,948 records
- **Casualties:** 127,883 records

The tables were connected using SQL, with vehicle and casualty records summarized before joining to maintain one row per collision in the final analytical dataset.

## Tools & Technologies

- **SQL / MySQL Workbench:** Data exploration, joins, aggregation, and analytical dataset preparation.
- **Python / Pandas:** Data cleaning, feature engineering, and exploratory data analysis.
- **Excel:** Data validation, PivotTables, KPIs, and interactive filtering.
- **Power BI:** Interactive dashboards and severity analysis.
- **Tableau:** Visual storytelling and comparative analysis.

## Project Workflow

### 1. SQL – Data Preparation
- Imported and explored the three related datasets.
- Connected tables using `collision_index`.
- Aggregated vehicle and casualty records before joining.
- Prepared a dataset with one row per collision.

### 2. Python – Cleaning & Feature Engineering
- Reviewed missing values and duplicate records.
- Converted coded values into readable categories.
- Created month, day, time-of-day, and driver-age groups.
- Prepared the data for severity analysis.

### 3. Excel – Validation
- Cross-checked the cleaned data.
- Built PivotTables and KPIs.
- Used slicers to compare collision severity across conditions.

### 4. Power BI – Interactive Analysis
Created dashboard pages exploring:
- Overall collision severity.
- Time, location, and lighting.
- Road and weather conditions.
- Driver age and location-related patterns.

### 5. Tableau – Visual Storytelling
Used Tableau to communicate the findings through interactive visualizations and comparisons.

## Key Findings

- More than one in four reported collisions in the analyzed dataset were classified as severe.
- Night-time and evening conditions were associated with higher severe-collision rates.
- Rural areas showed a higher severe-collision rate than urban areas.
- Lighting conditions were associated with differences in collision severity.
- The 66+ driver age group had the highest severe-collision rate in the analysis, at 33.53%.
- Collisions involving multiple vehicles had a severe-collision rate of 23.37%.

These findings describe patterns in the analyzed data and do not, by themselves, establish causation.

## Road Safety Recommendations

Based on the observed patterns, the analysis suggests:
- Reviewing lighting and safety measures in higher-risk areas.
- Giving additional attention to rural roads and single carriageways.
- Improving warnings around flooding and difficult road conditions.
- Supporting targeted driver-safety awareness initiatives.

## Project Deliverables

- SQL queries for data preparation.
- Python cleaning and analysis workflow.
- Excel validation and analysis.
- Power BI dashboards.
- Tableau visualizations.
- Summary of findings and recommendations.

## Author

**Jana Emara**  
Data Analytics | SQL | Python | Excel | Power BI | Tableau

[Portfolio](https://janaemara.github.io/portfolio/)
