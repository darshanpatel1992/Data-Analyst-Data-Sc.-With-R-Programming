# DecisionTree Regression model
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
#Fitting DecisionTree  Regression Model
#Create a regressor here
install.packages('rpart')
regressor = rpart(formula = Salary ~. , 
                  data= dataset,
                  control = rpart.control(minsplit = 1))


#Predict a new result 
y_pred = predict(regressor, newdata =data.frame(Level=6.5))



#Visulizing DecisionTree Regression model
  ggplot( ) + geom_point(aes(x=dataset$Level  ,y=dataset$Salary),
                       colour="Red") +
  geom_line(aes(x=dataset$Level ,y=predict(regressor, newdata = dataset)),
            colour="Blue")+
  ggtitle("Truth or Bluff(DecisionTree Regression Model)")+
  xlab("Level")+
  ylab("Salary")
# for decision tree the plot is not well so try with higher resolution
#Visulizing  Regression model(High Resolution)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot( ) + geom_point(aes(x=dataset$Level  ,y=dataset$Salary),
                       colour="Red") +
  geom_line(aes(x=x_grid ,y=predict(regressor, newdata = data.frame(Level = x_grid))),
            colour="Blue")+
  ggtitle("Truth or Bluff(DecisionTree Regression Model)")+
  xlab("Level")+
  ylab("Salary")













