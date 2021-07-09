############################Problem 1#############################
#install.packages('survminer')
#install.packages("survival")

library(survminer)
library(survival)
library(readr)

#loading the dataset
patient_data <- read_csv("C:\\Users\\hp\\Desktop\\survival assi\\Patient.csv")

attach(patient_data)
str(patient_data)

# Define variables 
time <- Followup
event <- Eventtype
group <- PatientID 

# Descriptive statistics
summary(time)
table(event)
table(group)

# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time, event) ~ 1)

summary(kmsurvival)

plot(kmsurvival, xlab="Time", ylab="Survival Probability")

ggsurvplot(kmsurvival, data=patient_data, risk.table = TRUE)


# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ group)
summary(kmsurvival1)

plot(kmsurvival1, xlab="Time", ylab="Survival Probability")
ggsurvplot(kmsurvival1, data=patient_data, risk.table = TRUE)

#####################################Problem 2############################
#install.packages('survminer')
#install.packages("survival")

library(survminer)
library(survival)
library(readxl)

#loading the dataset
ECG_data <- read_excel("C:\\Users\\hp\\Desktop\\survival assi\\ECG_Surv.xlsx")

attach(ECG_data)
str(ECG_data)

# Define variables 
time <- survival_time_hr
event <- alive
group <- group 

# Descriptive statistics
summary(time)
table(event)
table(group)

# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time, event) ~ 1)

summary(kmsurvival)

plot(kmsurvival, xlab="Time", ylab="Survival Probability")

ggsurvplot(kmsurvival, data=ECG_data, risk.table = TRUE)


# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ group)
summary(kmsurvival1)

plot(kmsurvival1, xlab="Time", ylab="Survival Probability")
ggsurvplot(kmsurvival1, data=ECG_data, risk.table = TRUE)

######################################END#######################################