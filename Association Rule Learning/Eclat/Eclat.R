#Eclat
#Data Preprocessing
#Create Sparce matrix
install.packages("arules")
library('arules')
datasets = read.csv('Market_Basket_Optimisation.csv',header = FALSE)
datasets = read.transactions('Market_Basket_Optimisation.csv',sep=',',rm.duplicates= TRUE)
summary(datasets)
itemFrequencyPlot(datasets, topN= 10)

#Training Eclat on dataset
#minimum support and confidence
#support  =3*7/7500

rules = eclat(datasets, parameter = list(support= 0.004, minlen= 2))

rules = eclat(datasets, parameter = list(support= 0.003, minlen= 2))

#we get 281 rules
#visulising the result
inspect(sort(rules,by='support')[1:10])



