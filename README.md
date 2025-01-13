# Sales Analysis Project

Welcome to the **Sales Analysis Project** repository! This project demonstrates how to work with large datasets by splitting them into multiple CSV files, analyzing the data using SQL scripts, and answering business-related questions based on the analysis.

---

## 📋 Table of Contents

1. [Introduction](#introduction)  
2. [Folder Structure](#folder-structure)  
3. [Data Description](#data-description)  
4. [SQL Scripts](#sql-scripts)  
5. [Questions Addressed](#questions-addressed)  
6. [Usage](#usage)  
7. [Contributing](#contributing)  
8. [License](#license)

---

## 📖 Introduction

The **Sales Analysis Project** focuses on breaking down a large dataset into manageable parts, analyzing the data with SQL, and solving various analytical problems.  
The dataset was split into **6 CSV files**, each representing a specific table/schema. SQL scripts corresponding to these CSV files are included for creating and querying the data.  
Additionally, this repository contains a **bonus folder** with an extra dataset, SQL script, and corresponding analytical questions.

---

## 📂 Folder Structure

`` plaintext
sales-analysis-project/
├── csv-files/                   # Contains 6 CSV files representing tables/schemas
│   ├── customers.csv
│   ├── orders.csv
│   ├── sales.csv
│   ├── products.csv
│   ├── categories.csv
│   ├── regions.csv
│
├── sql-scripts/                 # Contains 6 SQL scripts corresponding to the CSV files
│   ├── customers.sql
│   ├── orders.sql
│   ├── sales.sql
│   ├── products.sql
│   ├── categories.sql
│   ├── regions.sql
│
├── questions.txt                # Combines all questions from the 6 CSV files
│
├── bonus-folder/                # Additional resources for further exploration
│   ├── bonus-dataset.csv
│   ├── bonus-questions.txt
│   ├── bonus-sql-script.sql
│
└── README.md                    # Repository documentation

📊Data Description
Customers: Contains customer details such as ID, name, segment, and location.
Orders: Tracks customer orders, including IDs, dates, and shipping modes.
Sales: Represents order details, including product prices, quantities, and profits.
Products: Includes information about products such as IDs, names, and prices.
Categories: Lists product categories and their descriptions.
Regions: Provides data about regions, including names and IDs

🗃️ SQL Scripts
Each SQL script corresponds to one of the datasets, enabling easy table creation and data analysis. The scripts are modular and can be run independently.

❓ Questions Addressed
This project addresses a variety of analytical questions, such as:

What are the most profitable product categories?
How do sales and profits vary by month?
Which products have the highest profit margins?
How many unique products do customers purchase on average?
Which shipping modes are most popular?
For a full list, refer to **questions.txt**.
