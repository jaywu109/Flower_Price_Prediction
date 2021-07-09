library(xts)
library(aTSA)
library(TSA)
library(tseries)

# 讀取csv 並轉換成可進行分析之格式
dff <- read.csv("ave_month.csv")
ndff <- transform(dff, Date = as.Date(as.character(Date), "%Y-%m-%d"))
dayf <- xts(ndff[,-1], order.by=ndff[,1])

############################################
#plot of original data
plot(dayf)
adf.test(dayf)
kpss.test(dayf)
acf(dayf)
pacf(dayf)
eacf(dayf)
#----------------------------
#difference
dd=diff(dayf)
diff_day <- na.omit(dd)
plot(diff_day)

adf.test(diff_day)
kpss.test(diff_day)

acf(diff_day)
pacf(diff_day)
eacf(diff_day)
#-------------------------------------------------------
#ARIMA(0,1,3)
modelma01=arima(diff_day,order=c(0,0,3),include.mean=F)
modelma01
resma01=residuals(modelma01)

plot(resma01 , type = 'o')
hist(resma01)
qqnorm(resma01); qqline(resma01)

t.test(resma01)
shapiro.test(resma01)
ks.test(resma01,"pnorm",mean(resma01),sd(resma01))

acf(resma01)
Box.test(resma01, lag = 11,type = "Ljung")
Box.test(resma01, lag = 12,type = "Ljung")
Box.test(resma01, lag = 18,type = "Ljung")

#====================================================
#ARIMA(0,1,2)
modelarima012=arima(diff_day,order=c(0,0,2),include.mean=F)
modelarima012
resarima012=residuals(modelarima012)

#par(mfrow=c(3,1))
plot(resarima012 , type = 'o')
hist(resarima012)
qqnorm(resarima012); qqline(resarima012)

t.test(resarima012)
shapiro.test(resarima012)
ks.test(resarima012,"pnorm",mean(resarima012),sd(resarima012))
#par(mfrow=c(1,1))
acf(resarima012)
Box.test(resarima012, lag = 3,type = "Ljung")
Box.test(resarima012, lag = 11,type = "Ljung")
Box.test(resarima012, lag = 12,type = "Ljung")
Box.test(resarima012, lag = 18,type = "Ljung")

#====================================================
#ARIMA(5,1,0)
modelarima510=arima(diff_day,order=c(5,0,0),include.mean=F)
modelarima510
resarima510=residuals(modelarima510)

#par(mfrow=c(3,1))
plot(resarima510 , type = 'o')
hist(resarima510)
qqnorm(resarima510); qqline(resarima510)

t.test(resarima510)
shapiro.test(resarima510)
ks.test(resarima510,"pnorm",mean(resarima510),sd(resarima510))
#par(mfrow=c(1,1))
acf(resarima510)
Box.test(resarima510, lag = 6,type = "Ljung")
Box.test(resarima510, lag = 7,type = "Ljung")
Box.test(resarima510, lag = 11,type = "Ljung")
Box.test(resarima510, lag = 12,type = "Ljung")
Box.test(resarima510, lag = 18,type = "Ljung")
Box.test(resarima510, lag = 19,type = "Ljung")

#====================================================
#ARIMA(7,1,0)
modelarima710=arima(diff_day,order=c(7,0,0),include.mean=F)
modelarima710
resarima710=residuals(modelarima710)

#par(mfrow=c(3,1))
plot(resarima710 , type = 'o')
hist(resarima710)
qqnorm(resarima710); qqline(resarima710)

t.test(resarima710)
shapiro.test(resarima710)
ks.test(resarima710,"pnorm",mean(resarima710),sd(resarima710))
#par(mfrow=c(1,1))
acf(resarima710)
Box.test(resarima710, lag = 8,type = "Ljung")
Box.test(resarima710, lag = 11,type = "Ljung")
Box.test(resarima710, lag = 12,type = "Ljung")
Box.test(resarima710, lag = 18,type = "Ljung")

#====================================================
#ARIMA(10,1,0)
modelarima1010=arima(diff_day,order=c(10,0,0),include.mean=F)
modelarima1010
resarima1010=residuals(modelarima1010)

#par(mfrow=c(3,1))
plot(resarima1010 , type = 'o')
hist(resarima1010)
qqnorm(resarima1010); qqline(resarima1010)

t.test(resarima1010)
shapiro.test(resarima1010)
ks.test(resarima1010,"pnorm",mean(resarima1010),sd(resarima1010))
#par(mfrow=c(1,1))
acf(resarima1010)
Box.test(resarima1010, lag = 18,type = "Ljung")

#====================================================
#ARIMA(4,1,0)
modelarima410=arima(diff_day,order=c(4,0,0))
modelarima410
resarima410=residuals(modelarima410)

#par(mfrow=c(3,1))
plot(resarima410 , type = 'o')
hist(resarima410)
qqnorm(resarima410); qqline(resarima410)

t.test(resarima410)
shapiro.test(resarima410)
ks.test(resarima410,"pnorm",mean(resarima410),sd(resarima410))
#par(mfrow=c(1,1))
acf(resarima410)
Box.test(resarima410, lag = 5,type = "Ljung")
Box.test(resarima410, lag = 11,type = "Ljung")
Box.test(resarima410, lag = 12,type = "Ljung")
Box.test(resarima410, lag = 18,type = "Ljung")

#====================================================
#ARIMA(1,1,1)
modelarima111=arima(diff_day,order=c(1,0,1),include.mean=F)
modelarima111
resarima111=residuals(modelarima111)

#par(mfrow=c(3,1))
plot(resarima111 , type = 'o')
hist(resarima111)
qqnorm(resarima111); qqline(resarima111)

t.test(resarima111)
shapiro.test(resarima111)
ks.test(resarima111,"pnorm",mean(resarima111),sd(resarima111))
#par(mfrow=c(1,1))
acf(resarima111)
Box.test(resarima111, lag = 3,type = "Ljung")
Box.test(resarima111, lag = 11,type = "Ljung")
Box.test(resarima111, lag = 12,type = "Ljung")
Box.test(resarima111, lag = 18,type = "Ljung")


#----------------------------------------------------------
#ARIMA(2,1,2)
modelarima212=arima(diff_day,order=c(2,0,2),include.mean=F)
modelarima212
resarima212=residuals(modelarima212)

#par(mfrow=c(3,1))
plot(resarima212 , type = 'o')
hist(resarima212)
qqnorm(resarima212); qqline(resarima212)

t.test(resarima212)
shapiro.test(resarima212)
ks.test(resarima212,"pnorm",mean(resarima212),sd(resarima212))
#par(mfrow=c(1,1))
acf(resarima212)
Box.test(resarima212, lag = 12,type = "Ljung")
Box.test(resarima212, lag = 18,type = "Ljung")

detectAO(modelarima212)
detectIO(modelarima212)

d_ts <- ts(ndf$Average_price, start = c(1998,12), end = c(2020,11), frequency = 12)

model <- arima(d_ts ,order=c(2,1,2),include.mean = F)
model

plot(model,n.ahead=6)$pred
plot(model,n.ahead=6)$upi
plot(model,n.ahead=6)$lpi

win.graph(width=6.5,height=3,pointsize=8)
plot(model,n.ahead=6,ylab='Deviation',pch=19)

win.graph(width=6.5,height=3,pointsize=8)
plot(model,n1=2015 ,n.ahead=6,ylab='Deviation',pch=19)