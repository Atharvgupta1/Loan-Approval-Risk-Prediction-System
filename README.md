# 💳 Loan Approval & Risk Prediction System

## 📊 Overview

This project builds an end-to-end machine learning pipeline to predict loan approvals and assess applicant risk.
The system leverages **SQL, Python, and Power BI** to transform raw data into actionable business insights.

---

## 🎯 Objective

* Predict whether a loan application should be approved or rejected
* Identify high-risk applicants to minimise financial losses
* Provide a decision-support system for banks

---

## 📂 Data Source

* Dataset: Loan Prediction Dataset
* Source: Kaggle (Analytics Vidhya)
* Records: 614
* Features: Income, Credit History, Loan Amount, Property Area, etc.

---

## 🧹 Data Processing

* Handled missing values in categorical and numerical columns
* Converted categorical variables into numerical format
* Standardised inconsistent values (e.g., "3+" dependents)

---

## ⚙️ Feature Engineering

Created meaningful features:

* **Total Income** = Applicant + Coapplicant Income
* **Income-to-Loan Ratio** → Financial capacity indicator
* **EMI (Loan Burden)** → Loan repayment pressure

---

## 🤖 Machine Learning Models

* Logistic Regression
* Decision Tree
* Random Forest (Best Performing)

---

## 📈 Model Performance

| Model               | Accuracy | ROC-AUC  |
| ------------------- | -------- | -------- |
| Logistic Regression | 77%      | 0.72     |
| Decision Tree       | 72%      | 0.70     |
| Random Forest       | **80%**  | **0.76** |

---

## 🚨 Risk Segmentation

Applicants are classified into:

* 🟢 Low Risk
* 🟠 Medium Risk
* 🔴 High Risk

Based on predicted probabilities from the model.

---

## 📷 Dashboard Preview

![Dashboard](https://github.com/Atharvgupta1/Loan-Approval-Risk-Prediction-System/blob/402ccde77131f2d61b63753f6e9b457203d246e8/loan-Dashboard.png)

---

## 📊 Dashboard (Power BI)

The dashboard includes:

* KPI Metrics (Approval Rate, Income, Loan Amount)
* Loan Approval Distribution
* Risk Segmentation Analysis
* Credit History & Income Insights
* Interactive Filters (Gender, Area, Risk Level)

---

## 🔍 Key Insights

* Credit History is the **strongest predictor** of loan approval
* Applicants with higher incomes have higher approval rates
* High-risk applicants are still being approved → potential financial risk
* Loan burden (EMI) significantly impacts approval decisions

---

## 🛠️ Tech Stack

* Python (Pandas, NumPy, Scikit-learn)
* SQL (MySQL)
* Power BI (Visualisation)

---

## 🏁 Conclusion

* Random Forest achieved the best performance with strong predictive capability
* The model shows high recall for approved loans but struggles with rejected cases
* Risk segmentation provides a more practical decision-making framework than binary classification
* The system can help banks reduce risk, but further tuning is required to minimise false approvals
