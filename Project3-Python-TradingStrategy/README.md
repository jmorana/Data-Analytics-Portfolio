```markdown
# Python Trading Strategy Analysis

## Overview
Evaluated algorithmic trading strategies using Python to compare performance against a market baseline. Calculated technical indicators, simulated buy/sell signals, and analyzed ROI, volatility, and Sharpe ratio.

## Tools Used
- Python  
- Pandas  
- NumPy  
- Matplotlib  

## Skills Demonstrated
- Time-series analysis  
- Strategy evaluation  
- Statistical performance metrics  
- Data cleaning  
- Visualization  

## Key Code Snippet
```python
df['SMA_20'] = df['Close'].rolling(20).mean()
df['SMA_50'] = df['Close'].rolling(50).mean()

df['Signal'] = 0
df.loc[df['SMA_20'] > df['SMA_50'], 'Signal'] = 1
df.loc[df['SMA_20'] < df['SMA_50'], 'Signal'] = -1
