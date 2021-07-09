###################################Problem 1######################################
#loading required packages 
import pandas as pd

# Loading the the survival un-employment data
Patient_data = pd.read_csv("C:/Users/hp/Desktop/survival assi/Patient.csv")
Patient_data.head()
Patient_data.describe()

Patient_data["Followup"].describe()

# Followup is referring to time 
T = Patient_data.Followup

# Importing the KaplanMeierFitter model to fit the survival analysis
from lifelines import KaplanMeierFitter

# Initiating the KaplanMeierFitter model
kmf = KaplanMeierFitter()

# Fitting KaplanMeierFitter model on Time and Events for death 
kmf.fit(T, event_observed=Patient_data.Eventtype)

# Time-line estimations plot 
kmf.plot()

Patient_data.PatientID.value_counts()
# Applying KaplanMeierFitter model on Time and Events
kmf.fit(T[Patient_data.PatientID==['Joe','Jess','Ann','Mary','Frank','Steven','Andy', 'Elizabeth', 'Joe' ,  'Kate']], Patient_data.Eventtype[Patient_data.PatientID==['Joe','Jess','Ann','Mary','Frank','Steven','Andy', 'Elizabeth', 'Joe' ,  'Kate']])
kmf.plot()

###################################Problem 2###########################################
import pandas as pd
# Loading the the survival ECG_Surv data
ECG_data = pd.read_excel("C:/Users/hp/Desktop/survival assi/ECG_Surv.xlsx")
ECG_data.head()
ECG_data.describe()

ECG_data["survival_time_hr"].describe()

#droping na values
ECG_data.dropna(axis = 0 , inplace = True)

# Spell is referring to time 
T = ECG_data.survival_time_hr

#dropping name column from event
ECG_data.drop('name' , axis = 1 , inplace = True)

# Importing the KaplanMeierFitter model to fit the survival analysis
from lifelines import KaplanMeierFitter

# Initiating the KaplanMeierFitter model
kmf = KaplanMeierFitter()

# Fitting KaplanMeierFitter model on Time and Events for death 
kmf.fit(T, event_observed=ECG_data.alive)

# Time-line estimations plot 
kmf.plot()

# Over Multiple groups 
# For each group, here group is group
ECG_data.group.value_counts()

# Applying KaplanMeierFitter model on Time and Events for the group "1"
kmf.fit(T[ECG_data.group==1], ECG_data.alive[ECG_data.group==1], label='Group 1')
kmf.plot()

# Applying KaplanMeierFitter model on Time and Events for the group "2"
kmf.fit(T[ECG_data.group==2], ECG_data.alive[ECG_data.group==2], label='Group 2')
kmf.plot()

# Applying KaplanMeierFitter model on Time and Events for the group "3"
kmf.fit(T[ECG_data.group==3], ECG_data.alive[ECG_data.group==3], label='Group 3')
kmf.plot()

##########################################End###################################