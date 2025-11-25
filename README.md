# 💳 BNPL Customer Insights & Risk Analysis

A comprehensive data analysis project on **Buy Now, Pay Later (BNPL)** customer data, aimed at uncovering repayment trends, identifying high-risk patterns, and building a predictive framework for credit risk assessment.

---

## 🎯 Objective

- Analyze BNPL customer data to uncover trends in repayment behavior.
- Identify high-risk customers using statistical and rule-based criteria.
- Build a clean and reusable Python ETL pipeline.
- Enable SQL and Tableau/Power BI analysis for interactive insights.

---

## 🗂 Project Phases

### **Phase 1: Python Data Pipeline (ETL Setup)**

Purpose: Build a modular pipeline to manage data flow from ingestion to cleaning, transformation, validation, and storage.

**Pipeline Components:**

1. `extract_data()` – Loads raw data from CSV.
2. `clean_data(df)` – Handles nulls, duplicates, and corrects data types.
3. `transform_data(df)` – Creates new features, e.g., total repayment, high-risk flags.
4. `validate_data(df)` – Ensures data quality (e.g., valid credit scores, non-negative amounts).
5. `save_data(df, filename)` – Exports the clean dataset for further use.

**Python Code Sample:**

```python
from bnpl_pipeline import extract_data, clean_data, transform_data, validate_data, save_data

df = extract_data("bnpl_dataset_20000.csv")
df_clean = clean_data(df)
df_transformed = transform_data(df_clean)
problems = validate_data(df_transformed)
print("Validation problems:", problems)
save_data(df_transformed, "cleaned_bnpl_data.csv")

```
---
## Phase 2: SQL Analysis

After cleaning, the CSV can be imported into a database for SQL queries:

- Total purchases by customer
- Missed payments by merchant
- Average income vs. credit score
- Most common product categories per location
- Risk classification based on late payments

---

## Phase 3: Power BI Visualization

Dashboards and visuals:

- **KPIs:** Total Users, Active Users, Default Rate
- **Bar Chart:** Revenue by Product Category
- **Heatmap:** Risk by Region
- **Line Chart:** Monthly Sales Volume
- **Pie Chart:** Gender Distribution
- 
PowerBI Dashboard:
- <img width="1189" height="717" alt="image" src="https://github.com/user-attachments/assets/6698f818-3ff8-4b8c-b7ef-f8ea47c13bdd" />
---

## 📊 Dataset Details

- **Rows:** 20,000
- **Columns Include:**
  - Transaction data: amount, date, merchant
  - Customer info: age, gender, income, credit score
  - Payment plan details: down payment, installments
  - Behavioral indicators: late payments, fraud flag

---
---
