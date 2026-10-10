# Customer Churn & Retention Analysis

## Executive Summary:

Customer churn can result in lost customers and revenue for telecommunications companies. Understanding which customer characteristics and behaviors are associated with churn can help businesses identify customers who may need additional attention.

Using MySQL, DBeaver, SQL, and Tableau, I analyzed a telecommunications customer churn dataset containing 3,150 customer records. I cleaned and validated the data, performed SQL-based analysis, and created a Tableau dashboard to compare churn patterns across customer complaints, subscription length, tariff plans, customer value, age groups, and customer usage.

The analysis shows that customer complaints, customer usage, subscription length, tariff plans, and customer value are associated with differences in observed churn rates.

I also used SQL to identify a smaller group of active customers who had complained but had not yet churned, creating a potential retention opportunity segment for further investigation.

## Dashboard

<img width="2495" height="1161" alt="Screenshot 2026-10-10 at 1 20 44 PM" src="https://github.com/user-attachments/assets/b3cef26a-65f0-4419-b540-ede318e6f2db" />

### Business Problem:

The telecommunications company wants to better understand customer churn and identify customer groups that may require additional retention attention.

The analysis was designed to answer questions such as:

- What percentage of customers are churning?
- Are customers with complaints more likely to churn?
- How does customer churn vary by subscription length?
- How does customer usage differ between retained and churned customers?
- How does customer value relate to churn?
- How does churn vary between different tariff plans?
- How does churn vary across age groups?
- Which customers may represent potential retention opportunities?

The goal was to turn the customer data into useful insights that could help identify patterns in customer churn and potential areas for retention efforts.

### Methodology:

1. Imported the telecommunications customer churn dataset into MySQL using DBeaver.
2. Reviewed the dataset for missing values, unexpected values, and data consistency.
3. Renamed columns using `snake_case` to make them easier to work with in SQL.
4. Calculated the overall customer churn rate.
5. Compared churn rates between customers with and without complaints.
6. Analyzed churn across subscription length groups.
7. Compared churn between different tariff plans.
8. Compared average customer usage between retained and churned customers.
9. Analyzed customer value and created customer value groups.
10. Analyzed churn across different age groups.
11. Identified a potential retention opportunity group using customer status, churn status, complaints, and tariff plan.
12. Created retention priority groups based on customer value.
13. Exported the cleaned data for Tableau.
14. Created Tableau visualizations and a dashboard to communicate the findings.

### Skills:

**SQL / MySQL:** Data cleaning, data validation, filtering, aggregation, `GROUP BY`, `CASE` statements, calculated metrics, customer segmentation, churn analysis

**DBeaver:** SQL development, querying, data validation, database management, exporting data

**Tableau:** Data visualization, dashboards, calculated fields, aggregation, filtering, heatmaps, scatter plots, KPI cards, data storytelling

**Data Analysis:** Churn analysis, customer segmentation, trend analysis, comparison analysis, pattern identification, interpreting data, communicating insights

### Results & Business Recommendations:

The analysis showed several differences in observed churn rates across the customer groups.

The overall dataset contained **3,150 customers**, including:

- **495 churned customers**
- **2,655 retained customers**
- **15.71% overall churn rate**

Customers who reported complaints had a substantially higher observed churn rate than customers who did not report complaints.

- **No Complaint:** 10.14% churn rate
- **Complaint:** 82.99% churn rate

Subscription length also showed differences in observed churn rates:

- **0–6 months:** 50.00%
- **7–12 months:** 35.96%
- **13–24 months:** 2.77%
- **25+ months:** 16.27%

Customer usage was also substantially different between retained and churned customers.

| Metric | Retained | Churned |
|---|---:|---:|
| Seconds of Use | 5,014.22 | 1,566.63 |
| Frequency of Use | 76.98 | 29.13 |
| Frequency of SMS | 83.87 | 15.80 |
| Customer Value | 535.51 | 124.81 |

Customer value also showed differences in observed churn rates:

- **Low Value:** 25.83%
- **Medium Value:** 12.25%
- **High Value:** 0.92%
- **Very High Value:** 0.00%

Tariff plans also showed different observed churn rates:

- **Pay-as-you-go:** 16.83%
- **Contractual:** 2.45%

These results show that customer complaints, usage, customer value, subscription length, and tariff plan were associated with different observed churn rates in this dataset.

Based on the analysis, I recommend that a telecommunications company:

1. Monitor customers who submit complaints, as complaints were strongly associated with churn.
2. Pay closer attention to newer customers with shorter subscription lengths.
3. Monitor customer usage patterns for signs of lower engagement.
4. Consider customer value when identifying potential retention opportunities.
5. Investigate active customers who have complained but have not yet churned.
6. Continue tracking customer churn patterns as additional data becomes available.

The analysis provides a way to identify customer groups that may require additional attention and demonstrates how SQL and Tableau can be used to support customer retention analysis.

### Next Steps:

1. Add additional customer information such as customer demographics and service information.
2. Analyze churn trends over additional time periods as new data becomes available.
3. Explore whether specific retention strategies are associated with changes in churn rates.
4. Analyze customer usage patterns in more detail.
5. Explore predictive modeling to identify customers who may be at higher risk of churn.
6. Continue updating the Tableau dashboard as new customer data becomes available.

### Limitations:

The data represents customers from a specific telecommunications company and may not represent other telecommunications companies or markets.

The analysis identifies associations between variables and churn but does not prove that one variable directly causes another.

The dataset does not contain a customer ID in the version used for this project.

The retention opportunity analysis identifies customers who meet selected criteria but does not measure whether a retention campaign would actually prevent churn.

No machine learning model was used. This project focuses on SQL-based data analysis and Tableau visualization.

### Data Quality Note:

During data validation, 7 records were found with a `charge_amount` value of 10, while the UCI documentation describes the charge amount scale as 0–9.

These records were retained rather than removed or modified and were documented as a source-data anomaly.

### Data Source:

[UCI Iranian Churn Dataset](https://archive.ics.uci.edu/dataset/563/iranian%2Bchurn%2Bdataset)

### Interactive Tableau Dashboard:

[View the Interactive Tableau Dashboard](https://public.tableau.com/views/CustomerChurnRetentionAnalysis_17912722585760/CustomerChurnRetentionAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
