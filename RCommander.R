
summary(cmc)
library(abind, pos=22)
library(e1071, pos=23)
numSummary(cmc[,c("NumChild", "WifeAge")], statistics=c("mean", "sd", "IQR",
   "quantiles"), quantiles=c(0,.25,.5,.75,1))
numSummary(cmc[,"NumChild"], groups=cmc$Contraceptive, statistics=c("mean", 
  "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))
local({
  .Table <- with(cmc, table(Contraceptive))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})
local({
  .Table <- with(cmc, table(HusbOcc))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})
with(cmc, tapply(NumChild, list(Contraceptive), median, na.rm=TRUE))
library(nortest, pos=24)
with(cmc, shapiro.test(NumChild))
local({
  .Table <- xtabs(~Contraceptive+HusbOcc, data=cmc)
  cat("\nFrequency table:\n")
  print(.Table)
  cat("\nColumn percentages:\n")
  print(colPercents(.Table))
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})
t.test(NumChild~WifeRel, alternative='two.sided', conf.level=.95, 
  var.equal=FALSE, data=cmc)
library(mvtnorm, pos=25)
library(survival, pos=25)
library(MASS, pos=25)
library(TH.data, pos=25)
library(multcomp, pos=25)
AnovaModel.1 <- aov(NumChild ~ WifeEd, data=cmc)
summary(AnovaModel.1)
with(cmc, numSummary(NumChild, groups=WifeEd, statistics=c("mean", "sd")))
scatterplot(NumChild~WifeAge, reg.line=FALSE, smooth=TRUE, spread=FALSE, 
  boxplots=FALSE, span=0.5, ellipse=FALSE, levels=c(.5, .9), data=cmc)
Boxplot(NumChild~WifeEd, data=cmc, id.method="y")

