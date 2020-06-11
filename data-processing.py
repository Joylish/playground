import pandas as pd
import numpy as np
data = pd.read_csv('./report-2.txt', sep = "\t", encoding = "cp949",  skiprows= [1, 2, 3])
# print(data.head())
# print(data[["자치구", "동"]].head())
towns = data[["자치구", "동"]]
towns.to_csv("서울시동별.csv", mode='w')

