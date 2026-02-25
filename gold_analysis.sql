WITH Base_Data AS (
  SELECT 
    -- Converting string date to actual Date object
    CAST(Date AS DATE) as Market_Date,
    GLD as Gold_USD,
    SLV as Silver_USD,
    SPX as Sp500_index,
    USO as Oil_USD,
    `EUR USD` as EUR_USD_Rate,
    -- PHP Conversion (using 2026 benchmark of 57.68)
    ROUND(GLD * 57.68, 2) as Gold_PHP,
    ROUND(SLV * 57.68, 2) as Silver_PHP
  FROM `pp26-488519.gld_price.gold`
)
SELECT 
  *,
  -- 1. Gold-to-Silver Ratio (Standard Commodity Metric)
  ROUND(Gold_USD / NULLIF(Silver_USD, 0), 2) as Gold_Silver_Ratio,
  
  -- 2. Daily Price Change % (Shows Volatility Handling)
  ROUND(((Gold_USD - LAG(Gold_USD) OVER(ORDER BY Market_Date)) / LAG(Gold_USD) OVER(ORDER BY Market_Date)) * 100, 2) as Daily_Return_PCT,
  
  -- 3. 30-Day Moving Average in PHP (Smoothing the trend)
  ROUND(AVG(Gold_PHP) OVER(ORDER BY Market_Date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW), 2) as Gold_30day_MovAVG_PHP,

  -- 4. Market Sentiment Logic
  CASE 
    WHEN Gold_USD > LAG(Gold_USD) OVER(ORDER BY Market_Date) AND Sp500_index < LAG(Sp500_index) OVER(ORDER BY Market_Date) THEN 'Safe Haven Hedge'
    WHEN Gold_USD < LAG(Gold_USD) OVER(ORDER BY Market_Date) AND Sp500_index > LAG(Sp500_index) OVER(ORDER BY Market_Date) THEN 'Risk-On Market'
    ELSE 'Neutral'
  END as Market_regime

FROM Base_Data
ORDER BY Market_Date DESC