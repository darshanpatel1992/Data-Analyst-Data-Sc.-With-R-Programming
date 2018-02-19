#Artificial Neural Networks

# Importing the dataset
dataset = read.csv('Churn_Modelling.csv')
dataset = dataset[4:14]

#Encoding Categorical Variable 
dataset$Geography = as.numeric(factor(dataset$Geography,levels = c('France' ,'Spain', 'Germany'),
                          labels = c(1,2,3)))
                          

dataset$Gender =  as.numeric(factor(dataset$Gender,
                            levels = c('Female','Male'),
                            labels = c(1,2)))

# Splitting the dataset into the Training set and Test set
 install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Exited, SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
training_set[-11] = scale(training_set[-11])
test_set[-11] = scale(test_set[-11])

#Fitting ANN Classifier on the Training set
install.packages('h2o')
library(h2o) 
h2o.init(nthreads = -1)
classifier = h2o.deeplearning(y= 'Exited',
                              training_frame = as.h2o(training_set),
                              activation = 'Rectifier',
                              hidden =c(6,6),
                              epochs =100,
                              train_samples_per_iteration = -2)

#for No of Hidden Neurons take avg of all IV and DV (10+1)/2=11/2=5.5

#Predicting test set result 
prob_pred = h2o.predict(classifier,newdata = as.h2o(test_set[-11]))
prob_pred
y_pred= ifelse(prob_pred > 0.5 ,1,0 )
#Convert back into vector
y_pred = as.vector(y_pred)
y_pred

#Making Confusion Matrix
cm= table(test_set[,11],y_pred)
cm 
#Accuracy 
(1543+181)/2000
#Disconnect H2o

h2o.shutdown()
y







