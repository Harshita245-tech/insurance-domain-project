🛡️ Insurance Domain Data Engineering Project

1. Project Overview

The Insurance Domain Data Engineering Project is an end-to-end data engineering and analytics solution designed to ingest, process, transform, and visualize insurance-related data.

The project uses Supabase (PostgreSQL) as the source database and Databricks for data processing and transformation. It follows the Medallion Architecture (Bronze, Silver, and Gold) to organize data into raw, refined, and business-ready layers.

The transformed Gold-layer data is used to develop an interactive Databricks Analytics Dashboard and a Power BI report.

Project Objectives
- Build an end-to-end data engineering pipeline.
- Ingest insurance data from Supabase into Databricks.
- Implement Bronze, Silver, and Gold data layers.
- Support incremental processing of customer records.
- Create fact and dimension tables for analytics.
- Develop interactive dashboards and business reports.
- Automate project validation through GitHub Actions.

2. Technologies Used

| Technology | Purpose |
|---|---|
| Supabase (PostgreSQL) | Source database |
| Databricks | Data ingestion and processing |
| SQL | Data querying and transformation |
| PySpark | Distributed data processing |
| Delta Tables | Reliable data storage |
| Power BI | Business intelligence and reporting |
| Git | Version control |
| GitHub | Source code management |
| GitHub Actions | CI/CD workflow automation |


3. Project Architecture

The project follows the Medallion Architecture to process data through three layers.

Overall Data Flow:

Supabase → Bronze → Silver → Gold → Databricks Dashboard → Power BI

3.1 Bronze Layer – Data Ingestion

The Bronze layer stores raw data ingested from the Supabase PostgreSQL database.

Key activities:
- Ingest data from six source tables.
- Maintain raw datasets in Bronze Delta tables.
- Preserve source data for downstream processing.
- Support new and updated customer records using timestamp-based MERGE operations.
- Maintain an ingestion watermark table for tracking ingestion progress.

3.2 Silver Layer – Data Transformation

The Silver layer processes and refines the data received from the Bronze layer.

Key activities:
- Perform data cleaning and transformation.
- Maintain structured and refined datasets.
- Handle new and updated customer records using SQL MERGE operations.
- Improve data consistency and quality for downstream analytics.

3.3 Gold Layer – Business-Level Data

The Gold layer contains business-ready datasets designed for reporting and analytics.

It follows a Star Schema approach using dimension and fact tables.

Dimension Tables:
- dim_customer
- dim_agent
- dim_date
- dim_policy
- dim_product

Fact Tables:
- fact_policy
- fact_claim
- fact_payment

These tables support business analysis and dashboard development.

4. Source Database

The project uses Supabase as the source database, with six primary tables:

1. customers
2. agents
3. insurance_products
4. policies
5. claims
6. payments

The database schema is maintained in:

database/schema.sql

5. Incremental Data Processing

Incremental data processing is implemented to identify and process new and updated customer records.

The customers source table includes an updated_at timestamp column. This timestamp is used to identify changes to existing customer records.

Incremental Processing Flow

1. Customer data is updated in Supabase.
2. The updated record is identified using the updated_at timestamp.
3. The Bronze layer processes the new or modified record.
4. The Silver layer applies the changes using MERGE operations.
5. The Gold dimension table is updated with the latest customer information.
6. The Databricks dashboard is refreshed to display the updated information.

Customer Location Update Validation

An incremental customer update was tested successfully.

| Attribute | Value |
|---|---|
| Customer ID | 7 |
| Original City | Chennai |
| Updated City | Hyderabad |
| Validation Status | Successful |

The customer location change was propagated through the Bronze, Silver, and Gold layers and verified in the Gold customer dimension table.

The updated customer location was also reflected in the Databricks Analytics Dashboard after refreshing it.

6. Databricks Analytics Dashboard

An interactive Insurance Analytics Dashboard was developed using Gold-layer tables.

Dashboard Components

Key Performance Indicators (KPIs):
- Total Customers
- Total Policies
- Total Premium
- Total Claims
  
Analytical Visualizations:
- Claim Amount by Status
- Payment Amount by Payment Method
- Premium by Product
- Coverage by Product
- Policy Status
- Customer Location Details

The dashboard provides a consolidated view of insurance business performance and helps analyze customer, policy, claim, and payment information.


7. Power BI Integration

Power BI is integrated with Databricks to provide additional business intelligence and reporting capabilities.

The Gold-layer dimension and fact tables are used to build a Star Schema-based data model.

Power BI Report Includes
- Total Customers
- Total Policies
- Total Premium
- Total Claims
- Claim Amount by Status
- Payment Amount by Payment Method
- Premium by Product
- Policy Status

Relationships between dimension and fact tables support interactive filtering and business analysis.

8. GitHub Version Control

GitHub is used to manage project source files, SQL scripts, documentation, reports, and workflow configurations.

Repository Contents
- Database schema
- Bronze SQL queries
- Silver SQL queries
- Gold SQL queries
- Source CSV files
- Databricks dashboard export
- Power BI report
- Project screenshots
- README documentation
- GitHub Actions workflow configuration

Git provides version control, while GitHub provides centralized repository hosting and collaboration.


9. CI/CD Pipeline Using GitHub Actions

GitHub Actions is used to automate project validation through a CI/CD workflow.

Workflow Configuration:

.github/workflows/deploy.yml

Workflow Stages

1. Source Code Management

Project files and changes are maintained in the GitHub repository.

2. Continuous Integration

The workflow is triggered when changes are pushed to the main branch or when a pull request targets main.

3. Project Validation

The workflow checks for essential project files, including:
- README.md
- database folder

4. Environment Stages

The workflow executes three sequential jobs:

| Stage | Purpose |
|---|---|
| DEV | Development stage |
| QA | Quality Assurance stage |
| UAT | User Acceptance Testing stage |

Workflow Execution Results

| Parameter | Result |
|---|---|
| Workflow Name | Insurance Project CI/CD |
| Workflow File | `deploy.yml` |
| Branch | `main` |
| Execution Status | Success |
| Execution Time | 25 seconds |
| Validation Job | Successful |
| DEV Job | Successful |
| QA Job | Successful |
| UAT Job | Successful |

The workflow execution and individual job results can be monitored through the GitHub Actions tab.


10. Project Outcomes

The project demonstrates the implementation of an end-to-end data engineering and analytics workflow.

Key outcomes:
- Implemented Medallion Architecture using Bronze, Silver, and Gold layers.
- Ingested six insurance-related source tables from Supabase.
- Performed data cleaning and transformation using Databricks SQL.
- Implemented incremental customer record processing.
- Successfully validated customer location updates across data layers.
- Developed dimension and fact tables using Star Schema modeling.
- Created an interactive Databricks Analytics Dashboard.
- Integrated Gold-layer data with Power BI.
- Developed interactive Power BI visualizations.
- Managed project files using GitHub.
- Implemented GitHub Actions workflow validation with sequential DEV, QA, and UAT stages.


11. Repository Structure

insurance-domain-project/
│
├── database/
│   └── schema.sql
│
├── Bronze SQL Queries/
├── Silver SQL Queries/
├── Gold SQL Queries/
│
├── Insurance Analytics Dashboard/
├── Power BI Report/
├── Screenshots/
│
├── agents.csv
├── claims.csv
├── customers.csv
├── insurance_products.csv
├── payments.csv
├── policies.csv
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
└── README.md

13. Conclusion

The Insurance Domain Data Engineering Project demonstrates an end-to-end approach to insurance data processing and analytics using Supabase, Databricks, SQL, Delta Tables, Power BI, GitHub, and GitHub Actions.

By implementing Medallion Architecture, incremental data processing, dimensional modeling, interactive dashboards, and automated workflow validation, the project provides a structured approach to managing insurance data and generating meaningful business insights.

The solution combines data engineering, analytics, and version control practices to create a reusable foundation for insurance business reporting and decision-making.
