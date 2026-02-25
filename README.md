# Currency-Adjusted Asset Correlation: Gold as a Macro-Hedge in the Philippine Market
This project demonstrates an end-to-end data engineering and analytics pipeline designed to quantify the relationship between global equity markets (S&amp;P 500) and localized commodity prices (Gold in PHP). The goal was to determine the 'Safe Haven' effectiveness of Gold for Philippine-based investors during periods of high US market volatility.
![Gold vs SPX Analysis](gold_vs_spx_analysis.png)

Technical Highlights:
Cloud Data Ingestion: Automated retrieval of 10+ years of historical market data using the Google BigQuery Python client.

Localized Feature Engineering: Developed a SQL-based currency conversion layer to transform USD-denominated Gold prices (GLD) into Philippine Pesos (PHP), providing a localized risk perspective.

Data Smoothing: Implemented SQL Window Functions (AVG() OVER) to calculate a 30-day Moving Average, filtering out short-term market volatility to reveal long-term structural trends.

Advanced Data Viz: Engineered a Dual-Axis time-series model in Seaborn, enabling the comparison of two different data scales (Equity Index vs. Currency Value) on a single timeline.


How to Use This Repo:
SQL: Run the .sql script in BigQuery to create the currency-adjusted view.

Environment: Ensure you have google-cloud-bigquery, pandas, and seaborn installed.

Analysis: Run the gold_risk_analysis.py script to pull data from the cloud and generate the risk transmission chart.
