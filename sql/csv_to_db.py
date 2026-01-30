import pandas as pd
from sqlalchemy import create_engine

table_name = "renewable"
csv_file = "cleaned-wind-and-solar-energy.csv"
# csv_file = "month_aggregated-wind-and-solar-energy.csv"

engine = create_engine(f'sqlite:///{table_name}.db')

# 2. Read CSV
df = pd.read_csv(csv_file, index_col=0)

# 3. Write to SQL
df.to_sql(table_name, con=engine, index=False, if_exists='replace')

print("Upload complete.")
