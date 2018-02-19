#SVR 
# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)
#######################################################3
# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)
####################################################
#Fitting SVR    Regression Model
#Create a regressor here

install.packages('e1071')
regressor = svm(formula= Salary ~.,
                data=dataset,
                type = 'eps-regression')


#Predict a new result 
y_pred = predict(regressor, newdata =data.frame(Level=6.5))



#Visulizing SVR Regression model
install.packages("ggplot2")
ggplot( ) + geom_point(aes(x=dataset$Level  ,y=dataset$Salary),
                       colour="Red") +
  geom_line(aes(x=dataset$Level ,y=predict(regressor, newdata = dataset)),
            colour="Blue")+
  ggtitle("Truth or Bluff(Regression Model)")+
  xlab("Level")+
  ylab("Salary")


#Visulizing  SVR model(High Resolution)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot( ) + geom_point(aes(x=dataset$Level  ,y=dataset$Salary),
                       colour="Red") +
  geom_line(aes(x=x_grid ,y=predict(dataset$Level, newdata = data.frame(Level = x_grid))),
            colour="Blue")+
  ggtitle("Truth or Bluff(SVR Model)")+
  xlab("Level")+
  ylab("Salary")













