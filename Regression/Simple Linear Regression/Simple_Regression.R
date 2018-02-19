
#importing Data

dataset = read.csv("Salary_Data.csv")
# dataset= dataset[,2:3]

#Splitting dataset into training set and test set
install.packages("caTools")
library(caTools)
set.seed(12345)
split = sample.split(dataset$Salary,SplitRatio = 2/3) #interms of test set
training_set = subset(dataset,split== TRUE)
test_set = subset(dataset,split== FALSE)
#feature Scalling
# training_set = scale(training_set)
# #error because training_set is not numaric and if we cange to factor the 
# #base value is character only so we need to specfy second and third column to scalling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

##########################################################
# independent variable :years
#Dependent variable : salary

#Fitting simple linear regression to the training set
regressor = lm(formula=Salary ~ YearsExperience,
               data=training_set)

#Predict test_set results

y_pred= predict(regressor, newdata = test_set)
y_pred

#visulization of training set and test set
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             colour="Red")+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor, newdata = training_set)),
            colour='blue')+
  ggtitle('Salary Vs Exp(training set)')+
  xlab('years of Exp')+
  ylab('Salary')

#Test set 
ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),
             colour="Red")+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor, newdata = training_set)),
            colour='blue')+
  ggtitle('Salary Vs Exp(Test set)')+
  xlab('years of Exp')+
  ylab('Salary')




















