# Natural Language Processing
# importing dataset

dataset_origional = read.delim('Restaurant_Reviews.tsv',quote = '', stringsAsFactors = FALSE)

#Cleanning the text
install.packages('tm')
install.packages('SnowballC')
library(SnowballC)
library(tm)
corpus = VCorpus(VectorSource(dataset_origional$Review))
corpus = tm_map(corpus,content_transformer(tolower))#convert in lover case
corpus = tm_map(corpus,removeNumbers)#remove numbers("for 40 bucks a head, i really expect better food.")
corpus = tm_map(corpus,removePunctuation)# "for  bucks a head i really expect better food"
corpus = tm_map(corpus,removeWords,stopwords())# "wow loved  place" remove non relevent words
corpus = tm_map(corpus,stemDocument)#"wow love place"
corpus = tm_map(corpus, stripWhitespace)#Remove Extra space

#Creating the Bag of Words model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999)# To remove terms which are not frequent

#Classification model(Convert matrix dtm to dataframe)
dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_origional$Liked

# Encoding the target feature as factor
dataset$Liked= factor(dataset$Liked, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
 install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

  # Fitting Random Forest classifier to the Training set
# Create your classifier here
install.packages('randomForest')
library('randomForest')
classifier= randomForest(x= training_set[-692],
                         y=training_set$Liked,
                         nteee=10)


# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[,692], y_pred)

#Accuracy (76+77)/200 = 76%













