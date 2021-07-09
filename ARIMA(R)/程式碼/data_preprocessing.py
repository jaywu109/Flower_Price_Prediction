import pandas as pd
import numpy as np
from datetime import datetime

# 從民國轉西元
raw_series = pd.read_csv('flower_ave_price.csv')
convert_ser_date = raw_series.copy().Date

for itr in range(raw_series.shape[0]):
    date = raw_series.Date[itr].split('/')
    date[0] = str(int(date[0]) + 1911)
    result = '/'.join(date)
    
    convert_ser_date[itr] =  np.datetime64(datetime.strptime(result, "%Y/%m/%d").date())

convert_ser = raw_series.copy()
convert_ser.Date = convert_ser_date
convert_ser['Date'] = pd.to_datetime(convert_ser['Date'], errors='coerce')

cal = convert_ser.drop(6643)
Date = []
month_ave = []
for year in cal.Date.dt.year.unique():
    if year == 1998:
        m = 12
        mean = cal[(cal.Date.dt.year==year) & (cal.Date.dt.month==12)].Average_price.mean()
        date = np.datetime64(datetime.strptime(str(year)+'/'+str(m), "%Y/%m").date())

        month_ave.append(round(mean, 2))
        Date.append(date)

    elif year != 2020:
        for month in range(1,13):

            mean = cal[(cal.Date.dt.year==year) & (cal.Date.dt.month==month)].Average_price.mean()
            date = np.datetime64(datetime.strptime(str(year)+'/'+str(month), "%Y/%m").date())

            month_ave.append(round(mean, 2))
            Date.append(date)
    else :
        for month in range(1,12):

            mean = cal[(cal.Date.dt.year==2020) & (cal.Date.dt.month==month)].Average_price.mean()
            date = np.datetime64(datetime.strptime(str(year)+'/'+str(month), "%Y/%m").date())

            month_ave.append(round(mean, 2))
            Date.append(date)

d = {'Date': Date, 'Average_price': month_ave}
ave_month = pd.DataFrame(data=d)
ave_month.to_csv('ave_month.csv', index = None)