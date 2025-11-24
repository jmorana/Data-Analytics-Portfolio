import pandas as pd

# Sample trading analysis script

def run_analysis():
    # Load sample OHLCV data
    df = pd.read_csv('../data/ohlcv_sample.csv', parse_dates=['Date'])
    df = df.sort_values('Date')

    # Simple Moving Averages
    df['SMA_20'] = df['Close'].rolling(20).mean()
    df['SMA_50'] = df['Close'].rolling(50).mean()

    # Signal generation
    df['Signal'] = 0
    df.loc[df['SMA_20'] > df['SMA_50'], 'Signal'] = 1
    df.loc[df['SMA_20'] < df['SMA_50'], 'Signal'] = -1

    # Basic summary output (placeholder performance logic)
    print("Trading strategy signals breakdown:")
    print(df['Signal'].value_counts())

if __name__ == '__main__':
    run_analysis()
