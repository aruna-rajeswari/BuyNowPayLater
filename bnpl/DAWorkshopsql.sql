create database	bnk;

use bnk;

CREATE TABLE bnpl_customers (
    transaction_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    location VARCHAR(100),
    transaction_date DATE,
    purchase_amount DECIMAL(12,2),
    down_payment DECIMAL(12,2),
    installment_amount DECIMAL(12,2),
    installments INT,
    payment_status VARCHAR(20),
    product_category VARCHAR(50),
    merchant_name VARCHAR(100),
    customer_income DECIMAL(12,2),
    credit_score INT,
    late_payments INT,
    account_created DATE,
    fraud_flag BOOLEAN,
    financial_amount DECIMAL(12,2),
    repayment_rate DECIMAL(5,2),
    high_risk BOOLEAN,
    monthly_installment_est DECIMAL(12,2)
);

select *from bnpl_customers;

-- 1.	Total purchases by customer
SELECT 
    customer_id,
    COUNT(*) AS num_purchases,
    SUM(purchase_amount) AS total_spent
FROM
    bnpl_customers
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 50;

-- 2  Missed payments by the merchant
SELECT 
    merchant_name,
    COUNT(*) AS missed_payments
FROM 
    bnpl_customers
WHERE 
    payment_status = 'Missed'
GROUP BY 
    merchant_name
ORDER BY 
    missed_payments DESC;

-- 3. Avg income vs. credit score
SELECT 
    credit_score,
    ROUND(AVG(customer_income), 2) AS avg_income
FROM 
    bnpl_customers
GROUP BY 
    credit_score
ORDER BY 
    credit_score;
    
-- 4 Most common product categories per location    
SELECT 
    location,
    product_category,
    COUNT(*) AS category_count
FROM 
    bnpl_customers
GROUP BY 
    location, product_category
ORDER BY 
    location,
    category_count DESC;
    
-- 5. Risk classification based on late payments
SELECT 
    customer_id,
    customer_name,
    late_payments,
    CASE 
        WHEN late_payments >= 2 THEN 'High Risk'
        ELSE 'Low Risk'
    END AS risk_classification
FROM 
    bnpl_customers
ORDER BY 
    late_payments DESC;