#Multiple Linear Regression
#importing Data
# Dependent Vatiable : Profit
# independent variable : All rest than profit
dataset = read.csv("50_Startups.csv")
# dataset= dataset[,2:3]

# Encoding categorical data
dataset$State = factor(dataset$State ,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c("1", "2", "3"))

#Splitting dataset into training set and test set
install.packages("caTools")
library(caTools)
set.seed(12345)
split = sample.split(dataset$Profit,SplitRatio = 0.8) #interms of test set
training_set = subset(dataset,split== TRUE)
test_set = subset(dataset,split== FALSE)
#feature Scalling
# training_set = scale(training_set)
# #error because training_set is not numaric and if we cange to factor the 
# #base value is character only so we need to specfy second and third column to scalling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])


#Fitting multiple linear regression into training set
colnames(dataset)
regressor= lm(formula=Profit ~.,data=training_set) #R is execute all Indipendent variable from .
summary(regressor)

#from summary we know that p value of RDSpend is highly statistical
#and other dependent variables are not statistical so we cal also go
#for simple linear regression model which give same 

#regressor= lm(formula=Profit ~R.D.Spend+Administration+Marketing.Spend+State)
regressorSimple= lm(formula=Profit ~R.D.Spend, data= training_set)
summary(regressor)

# Practice with test set result
y_pred = predict(regressor,newdata = test_set)
y_pred

#Building the optimal model using Backward Elimination
colnames(dataset)
regressor= lm(formula=Profit ~R.D.Spend + Administration + Marketing.Spend + State,
              data=dataset)
summary(regressor)
#Step 3 (Remove State)
regressor= lm(formula=Profit ~R.D.Spend + Administration + Marketing.Spend,
              data=dataset)
summary(regressor)
# Remove Administration because P value > 0.05
regressor= lm(formula=Profit ~R.D.Spend + Marketing.Spend,
              data=dataset)
summary(regressor)
# Remove Marketing.Spend because P value(0.06) > 0.05
regressor= lm(formula=Profit ~R.D.Spend,
              data=dataset)
summary(regressor)
#Finished 










