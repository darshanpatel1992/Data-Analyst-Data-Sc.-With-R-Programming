#Hierarchical Clustering
# Importing the dataset
dataset = read.csv('Mall_Customers.csv')
x= dataset[4:5]

# Using dendrogram to find the optimal no of clusters
dendrogram = hclust(dist(x,method = 'euclidean'),
                    method = 'ward.D')

plot(dendrogram,
     main=paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distence')
#see verticle line which is large and calculate verticle line
#of same level here is 5
#Fitting HC to dataset
HC = hclust(dist(x,method = 'euclidean'),
                    method = 'ward.D')
y_hc = cutree(HC, 5)

#Visulising the Clusters

clusplot(dataset,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')















