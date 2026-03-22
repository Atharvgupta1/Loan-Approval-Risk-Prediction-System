CREATE DATABASE loan_prediction_db;

use loan_prediction_db;

CREATE TABLE loans (
    loan_id VARCHAR(50),
    gender VARCHAR(10),
    married VARCHAR(10),
    dependents VARCHAR(10),
    education VARCHAR(20),
    self_employed VARCHAR(10),
    applicant_income FLOAT,
    coapplicant_income FLOAT,
    loan_amount FLOAT,
    loan_term FLOAT,
    credit_history FLOAT,
    property_area VARCHAR(20),
    loan_status VARCHAR(5));

-- Basic Validation--------
SELECT COUNT(*) AS total_rows FROM loans;
SELECT DISTINCT loan_status FROM loans;
SELECT * FROM loans LIMIT 10;

--  Data Cleaning----------
-- Converting Loan Status(Numeric)

SET SQL_SAFE_UPDATES = 0;

UPDATE loans
SET loan_status = CASE 
    WHEN loan_status = 'Y' THEN '1'
    WHEN loan_status = 'N' THEN '0'
END
WHERE loan_status IS NOT NULL;

-- Handle Dependents ("3+" to 3)
UPDATE loans
SET dependents = '3'
WHERE dependents = '3+';

-- Replacing Missing Values
-- Categorical to Mode
UPDATE loans SET gender = 'Male' WHERE gender IS NULL;
UPDATE loans SET married = 'Yes' WHERE married IS NULL;
UPDATE loans SET self_employed = 'No' WHERE self_employed IS NULL;
UPDATE loans SET dependents = '0' WHERE dependents IS NULL;

-- Numerical to Average
UPDATE loans
SET loan_term = (SELECT avg_val FROM (SELECT AVG(loan_term) 
AS avg_val FROM loans) AS temp)
WHERE loan_term IS NULL;

UPDATE loans
SET loan_term = (SELECT avg_val FROM (SELECT AVG(loan_term) 
AS avg_val FROM loans) AS temp)
WHERE loan_term IS NULL;

UPDATE loans
SET credit_history = 1
WHERE credit_history IS NULL;

-- Feature Engineering
-- Total Income

ALTER TABLE loans ADD COLUMN total_income FLOAT;
UPDATE loans
SET total_income = applicant_income + coapplicant_income;

-- Income to Loan Ratio
ALTER TABLE loans ADD COLUMN income_loan_ratio FLOAT;
UPDATE loans
SET income_loan_ratio = total_income / loan_amount;

-- Loan Burden
ALTER TABLE loans ADD COLUMN emi FLOAT;
UPDATE loans
SET emi = loan_amount / loan_term;

-- Analysis
-- Loan Approval Distribution
SELECT loan_status, COUNT(*) AS count
FROM loans
GROUP BY loan_status;

-- Approval by Gender
SELECT gender, loan_status, COUNT(*) AS count
FROM loans
GROUP BY gender, loan_status;

-- Approval by Credit History
SELECT credit_history, loan_status, COUNT(*) AS count
FROM loans
GROUP BY credit_history, loan_status;

-- Avg Income vs Approval
SELECT loan_status, AVG(total_income) AS avg_income
FROM loans
GROUP BY loan_status;


