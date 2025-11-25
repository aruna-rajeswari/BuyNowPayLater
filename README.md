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

### **Phase 0: Python Data Pipeline (ETL Setup)**

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
