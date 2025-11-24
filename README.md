# Data Warehouse & Analytics Project

Building a modern data warehouse with SQL Server, including ETL processes, data modeling, and analytics

---
## Data Architecture

The data architecture for this project follows Medallion Architecture

Bronze, Silver, and Gold layers:


<img width="878" height="695" alt="data_architecture" src="https://github.com/user-attachments/assets/dbb20dbb-cba7-458e-a40e-59ab8f5a6860" />


 1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
 2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
 3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---


##  Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.
---
#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  
