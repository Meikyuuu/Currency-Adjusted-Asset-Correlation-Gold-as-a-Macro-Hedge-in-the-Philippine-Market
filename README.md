# Currency-Adjusted Asset Correlation: Gold as a Macro-Hedge in the Philippine Market

This project demonstrates an end-to-end data engineering and analytics pipeline designed to quantify the relationship between global equity markets (S&P 500) and localized commodity prices (Gold in PHP). The goal was to determine the 'Safe Haven' effectiveness of Gold for Philippine-based investors during periods of high US market volatility.

![Gold vs SPX Analysis](gold_vs_spx_analysis.png)

## **Technical Highlights**

* **Cloud Data Ingestion:** Automated retrieval of 10+ years of historical market data using the **Google BigQuery** Python client.
* **Localized Feature Engineering:** Developed a SQL-based currency conversion layer to transform USD-denominated Gold prices (GLD) into Philippine Pesos (PHP), providing a localized risk perspective.
* **Data Smoothing:** Implemented **SQL Window Functions** (`AVG() OVER`) to calculate a 30-day Moving Average, filtering out short-term market volatility to reveal long-term structural trends.
* **Advanced Data Viz:** Engineered a **Dual-Axis time-series model** in Seaborn, enabling the comparison of two different data scales (Equity Index vs. Currency Value) on a single timeline.

## **Key Insights & Findings**

* **Safe-Haven Behavior During Stress Regimes:** During the March 2020 equity market drawdown, PHP-denominated gold returns remained stable or positive while the S&P 500 experienced significant negative log returns. This supports gold’s role as a conditional hedge during high-volatility equity regimes.
* **Currency Amplification Effect:** By incorporating historical USD/PHP exchange rates, the analysis shows that gold priced in PHP exhibits amplified return dynamics relative to USD gold. This reflects embedded FX volatility and highlights the additional hedge dimension for Philippine-based investors.
* **Regime-Dependent Correlation:** Rolling 30-day correlation analysis revealed regime shifts where the relationship between gold and equity returns transitioned from mildly positive to negative during equity stress events. This indicates that hedge effectiveness is conditional rather than static.
* **Lagged Risk Transmission:** Time-series visualization suggests that gold volatility often reacts with a short delay to US equity stress events, implying partial transmission lag between global market shocks and localized asset behavior.

## **How to Use This Repo**

* **SQL:** Run the `.sql` script in BigQuery to create the currency-adjusted view.
* **Environment:** Ensure you have `google-cloud-bigquery`, `pandas`, and `seaborn` installed in your Python environment.
* **Analysis:** Run the `gold_risk_analysis.py` script to pull data from the cloud and generate the risk transmission chart.

## **Data Sources**

* **Market Data:** Historical S&P 500 (SPY) and Gold (GLD) prices sourced via Yahoo Finance API.
* **Currency Exchange:** USD/PHP historical exchange rates used for localized price modeling.
* **Tools Used:** Google BigQuery (Data Warehouse), Python (Analysis), and AI-assisted script optimization.
