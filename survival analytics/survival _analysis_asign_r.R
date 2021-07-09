########################## PROBLEM 1 #########################
# Survival Analysis in R

install.packages('survminer')
install.packages("survival")

library(survminer)
library(survival)

??survminer
??survival

patient_data <- read.csv(file.choose())

attach(patient_data)
str(patient_data)

#EDA
patient_data <- patient_data[,c(2,3,4)]
str(patient_data)
colnames(patient_data)

# Define variables 
time <- Followup
event <- Eventtype
group <- Scenario  # unemployment insurance can take 2 values 0 or 1 


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

####################### PROBLEM 2 ######################

# Survival Analysis in R

install.packages('survminer')
install.packages("survival")

library(survminer)
library(survival)

??survminer
??survival

ecg_data <- readxl::read_excel(file.choose())
attach(ecg_data)
str(ecg_data)

#EDA
ecg_data <- ecg_data[,c(1,2,12)]
str(ecg_data)
colnames(ecg_data)

# Define variables 
time <- survival_time_hr
event <- alive
group <- group  # unemployment insurance can take 2 values 0 or 1 

# Descriptive statistics
summary(time)
table(event)
table(group)

# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time, event) ~ 1)

summary(kmsurvival)

plot(kmsurvival, xlab="Time", ylab="Survival Probability")

ggsurvplot(kmsurvival, data=ecg_data, risk.table = TRUE)


# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ group)
summary(kmsurvival1)

plot(kmsurvival1, xlab="Time", ylab="Survival Probability")
ggsurvplot(kmsurvival1, data=ecg_data, risk.table = TRUE)

############### end #######################