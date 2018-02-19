#Kmeans algorithm
#importing Dataset

dataset = read.csv('Mall_Customers.csv')
x= dataset[4:5]
#Using the elbow methode to fine no of clusters
set.seed(6)
WCSS = vector()
for(i in 1:10) WCSS[i] = sum(kmeans(x,i)$withinss)
plot(1:10,WCSS, type = "b",main=paste('Cluster of Clients'),xlab='No of Clusters',ylab='WCSS')

#Now we know that no of cluster is 5 

#Applying kmeans to the dataset
set.seed(29)
kmeans = kmeans(x,5,iter.max = 300, nstart = 10)
#visualising clusters
install.packages('cluster')
library('cluster')                 
clusplot(x,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main=paste('Cluster of Clients'),
         xlab= 'Annual Income',
         ylab='Spending Score')






