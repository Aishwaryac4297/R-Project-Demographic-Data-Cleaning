setwd('C:\\Users\\Aishwarya\\Desktop\\project+notes')
library(readr)
df<-read_csv('R Project Cleaning Data csv file.csv')
View(df)

library(dplyr)
str(df)

newdf1<-df %>% mutate(Facility=replace(Facility,match(c('EP1202','EP1207'),EmpID),'Beaverton'))


newdf1<-newdf1 %>% mutate(JobLevel=replace(JobLevel,match('EP1203',EmpID),NA))


newdf1<-newdf1 %>% mutate(JobLevel=replace(JobLevel,match('EP1210',EmpID),1))


newdf1<-newdf1 %>% mutate(OnboardingCompleted=ifelse(OnboardingCompleted=='No','Yes',OnboardingCompleted))


newdf1$HireDate<-newdf1$StartDate


newdf1$StartDate<-NULL


newdf1<-select(newdf1,EmpID,Facility,JobLevel,HireDate,everything())
View(newdf1)