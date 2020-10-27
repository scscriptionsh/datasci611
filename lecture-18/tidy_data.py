import bokeh as bk
import pandas as pd
import numpy as np

from pandasql import sqldf
dfq = lambda q: sqldf(q, globals())

raw = pd.read_csv("source_data/datasets_38396_60978_charcters_stats.csv");
nice_data = dfq("select * from raw where total > 5")

nice_data.to_csv("derived_data/nice_data.csv",index=False);
