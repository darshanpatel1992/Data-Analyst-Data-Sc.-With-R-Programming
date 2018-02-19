#Apriori 
#Data Preprocessing
#Create Sparce matrix
install.packages("arules")
library('arules')
datasets = read.csv('Market_Basket_Optimisation.csv',header = FALSE)
datasets = read.transactions('Market_Basket_Optimisation.csv',sep=',',rm.duplicates= TRUE)
summary(datasets)
itemFrequencyPlot(datasets, topN= 10)

#Training Apriori on dataset
#minimum support and confidence
#support  =3*7/7500

rules = apriori(datasets, parameter = list(support= 0.003, confidence= 0.8))

rules = apriori(datasets, parameter = list(support= 0.003, confidence= 0.4))
rules = apriori(datasets, parameter = list(support= 0.003, confidence= 0.2))
#change support for 4 times item a day
#support  =4*7/7500
rules = apriori(datasets, parameter = list(support= 0.004, confidence= 0.2))


#we get 281 rules
#visulising the result
inspect(sort(rules,by='lift')[1:10])



