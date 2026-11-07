# 🛡️ Insurance Domain Data Engineering Project

## 1. Project Overview

The Insurance Domain Data Engineering Project is an end-to-end data engineering and analytics solution designed to manage, process, transform, and visualize insurance data.

The project uses a Medallion Architecture (Bronze, Silver, and Gold) in Databricks to process data from Supabase. The transformed Gold-layer data is used to build an interactive analytics dashboard in Databricks and a Power BI report.

The main objective is to create a reusable data pipeline that supports incremental data updates and provides meaningful insights into customers, policies, claims, payments, agents, and insurance products.

## 2. Technologies Used

- **Supabase (PostgreSQL):** Source database.
- **Databricks:** Data ingestion, processing, and transformation.
- **PySpark / SQL:** Data processing and transformation.
- **Delta Tables:** Storage of processed data.
- **Power BI:** Business intelligence and reporting.
- **GitHub:** Source code management and version control.
- **GitHub Actions:** CI/CD automation (implementation in progress).

## 3. Project Architecture

The project follows the Medallion Architecture.

**Source → Bronze → Silver → Gold → Dashboard → Power BI**

### Bronze Layer – Data Ingestion

- Ingests source data from Supabase into Databricks.
- Maintains raw data in Bronze tables.
- Includes ingestion queries for all six source tables.
- Implements incremental customer ingestion using an `updated_at` timestamp and watermark tracking.

### Silver Layer – Data Transformation

- Processes data from the Bronze layer.
- Performs data cleaning and transformation.
- Maintains structured and refined datasets.
- Uses MERGE operations to handle new and updated customer records.

### Gold Layer – Business-Level Data

- Creates dimension and fact tables for analytics.
- Organizes data using a star-schema approach.
- Provides business-ready data for dashboards and reporting.

**Gold Dimension Tables:**
- dim_customer
- dim_agent
- dim_date
- dim_policy
- dim_product

**Gold Fact Tables:**
- fact_policy
- fact_claim
- fact_payment

## 4. Source Database Tables

The project uses six main source tables from Supabase:

1. customers
2. agents
3. insurance_products
4. policies
5. claims
6. payments

The database schema is available in the `database` folder.

## 5. Incremental Data Processing

Incremental processing is implemented to capture customer record updates.

An `updated_at` timestamp is maintained in the source customer table. When a customer record changes, the timestamp is updated automatically.

The pipeline identifies changed records and propagates updates through the Bronze, Silver, and Gold layers.

**Validation Example:**

- Customer ID: 7
- Original city: Chennai
- Updated city: Hyderabad
- The updated location was verified in the Gold customer dimension table.

This demonstrates the propagation of customer updates through the data pipeline.

## 6. Databricks Dashboard

An interactive Insurance Analytics Dashboard was developed using Gold-layer tables.

The dashboard includes:

- Total Customers
- Total Policies
- Total Premium
- Total Claims
- Claim Amount by Status
- Payment Amount by Payment Method
- Premium by Product
- Coverage by Product
- Policy Status
- Customer Location Details

## 7. Power BI Integration

Power BI is integrated with Databricks to provide interactive business reporting.

The Gold-layer dimension and fact tables are used to create a star-schema-based data model.

The report includes customer, policy, premium, claim, payment, and product analytics.

Customer location details are also included to verify updated customer information.

## 8. GitHub Version Control

GitHub is used to maintain the project files, including:

- Database schema
- Bronze SQL queries
- Silver SQL queries
- Gold SQL queries
- Databricks dashboard export
- Power BI report
- Project screenshots and documentation

## 9. CI/CD Pipeline – Implementation in Progress

The final project assignment is to implement CI/CD using GitHub Actions.

The planned workflow will automate the promotion of project changes across:

**Development (DEV) → Quality Assurance (QA) → User Acceptance Testing (UAT)**

The workflow will use GitHub Actions to manage deployment steps and validate changes across environments.

This section will be updated after the CI/CD workflow is implemented and tested.

## 10. Project Outcomes

- Implemented a Bronze, Silver, and Gold data architecture.
- Ingested six insurance-related source tables.
- Implemented data transformation and incremental customer updates.
- Created dimension and fact tables using a star-schema approach.
- Developed a Databricks analytics dashboard.
- Integrated Databricks Gold-layer data with Power BI.
- Maintained project SQL files, reports, and documentation in GitHub.
- Preparing automated CI/CD deployment using GitHub Actions.

## 11. Repository Structure

```text
insurance-domain-project/
│
├── database/
│   └── schema.sql
│
├── Bronze SQL Queries
├── Silver SQL Queries
├── Gold SQL Queries
│
├── Insurance Analytics Dashboard
├── Power BI Report
├── Screenshots
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
│
└── README.md
```

*Note: The CI/CD workflow and final folder organization will be updated as implementation progresses.*

## 12. Conclusion

This project demonstrates an end-to-end insurance data engineering and analytics workflow using Supabase, Databricks, SQL, Delta tables, Power BI, and GitHub. It provides a structured approach to data ingestion, transformation, incremental updates, and business reporting. The final phase focuses on automating deployment through GitHub Actions and implementing a Dev-to-QA-to-UAT CI/CD workflow.
