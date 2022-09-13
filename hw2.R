rm(list = ls())
library(readr)
library(dplyr)
C1survey <- read.csv("https://raw.githubusercontent.com/kijohnson/ADA/master/Class%201%20Survey%20Fall%202022.csv")
dim(C1survey)
#42 ppl respond the survey and 27 variables
names(C1survey)
C1survey <- rename(C1survey, "like_cats" = "Do.you.like.cats.")
C1survey <- rename(C1survey, "like_dogs" = "Do.you.like.dogs.")
C1survey <- rename(C1survey, "stranded_on_desert_island" = "If.you.were.stranded.on.a.desert.island..what.is.the.one.item.you.want.to.have.with.you.")
C1survey <- rename(C1survey, "slogan" = "If.you.were.to.create.a.slogan.for.your.life..what.would.the.slogan.be...Examples...Eat..drink..and.be.merry..for.tomorrow..we.all.die....Bite.off.more.than.you.can.chew....There.are.far.better.things.ahead.than.any.we.leave.behind...")
class(C1survey$ID)
class(C1survey$like_cats)
class(C1survey$What.is.your.favorite.Month.)
class(C1survey$What.is.your.birth.day..e.g..October.28.report.28..)
class(C1survey$What.is.your.birth.month..e.g..October.28.report.10..)
C1survey$birth_day_n<-as.numeric(C1survey$What.is.your.birth.day..e.g..October.28.report.28..)
class(C1survey$birth_day_n)
C1survey$birth_month_n<-as.numeric(C1survey$What.is.your.birth.month..e.g..October.28.report.10..)
class(C1survey$birth_month_n)
C1survey_1 <- na.omit(C1survey)
median(C1survey_1$birth_day_n, na.rm=TRUE) #19
median(C1survey_1$birth_month_n, na.rm=TRUE) #6.5
C1survey_1 <- mutate(C1survey_1, bseason = case_when(
  birth_month_n >= 3 & birth_month_n < 6 ~ "Spring",
  birth_month_n >= 6 & birth_month_n < 9 ~ "Summer",
  birth_month_n >= 9 & birth_month_n < 12 ~ "Autumn",
  TRUE ~ "Winter"
))
class(C1survey_1$bseason)
table(C1survey_1$bseason) 







