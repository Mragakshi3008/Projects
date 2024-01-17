#22229981
#mragakshi
#MS5108
# Load necessary libraries
library(ggplot2)
# Histogram using R base graphics
hist(crime_dataset$VALUE, 
     main = "Percentage of households that were victims of any type of household crime", 
     xlab = "Percentage", 
     ylab = "Frequency")
# Histogram using ggplot2
library(ggplot2)

ggplot(crime_dataset, aes(x = VALUE)) +
  geom_histogram(binwidth = 1, fill = "blue") +
  labs(title = "Percentage of households that were victims of any type of household crime", 
       x = "Percentage", 
       y = "Frequency")

# Scatter plot using R base graphics
plot(crime_dataset$C03354V04040, crime_dataset$VALUE, 
     main = "Percentage of households that were victims of burglary by level of deprivation", 
     xlab = "Level of deprivation", 
     ylab = "Percentage o
     f households that were victims of burglary")


# Create a scatter plot with colors
ggplot(crime_dataset, aes(x = `Type of household crime`, y = VALUE, color = `Levels of Deprivation`)) +
  geom_point() +
  labs(title = "Household Crime by Deprivation Levels",
       x = "Type of household crime",
       y = "Percentage of households") +
  theme_minimal()

#question 3
# Load libraries
library(tm)
library(dplyr)
library(ggplot2)

# Load the CSV file
tweets <- read.csv("C:/r/tweets.csv", stringsAsFactors = FALSE, encoding = "UTF-8")

# Create a corpus from the text of the tweets
tweets_corpus <- Corpus(VectorSource(tweets$text))

# Remove empty documents
tweets_corpus <- tm_filter(tweets_corpus, function(x) length(x) > 0)

# Convert all text to lowercase
tweets_corpus <- tm_map(tweets_corpus, content_transformer(tolower))

# Remove punctuation
tweets_corpus <- tm_map(tweets_corpus, removePunctuation)

# Remove numbers
tweets_corpus <- tm_map(tweets_corpus, removeNumbers)

# Remove common English stop words
tweets_corpus <- tm_map(tweets_corpus, removeWords, stopwords("english"))

# Create a document-term matrix
tweets_dtm <- DocumentTermMatrix(tweets_corpus)

# Convert the document-term matrix to a data frame
tweets_df <- as.data.frame(as.matrix(tweets_dtm))

# Calculate the frequency of each word in the corpus
word_freq <- colSums(tweets_df)

# Convert the results to a data frame
word_freq_df <- data.frame(word = names(word_freq), freq = word_freq)

# Plot the top 25 words
ggplot(head(arrange(word_freq_df, desc(freq)), 25), aes(x = reorder(word, -freq), y = freq)) +
  geom_bar(stat = "identity") +
  ggtitle("Top 25 Words in Mr. XYZ's Tweets") +
  xlab("Word") +
  ylab("Frequency")

# Create a word cloud of the 40 most common words
set.seed(123)  # Set the seed for reproducibility
wordcloud(names(word_freq)[1:40], freq = word_freq[1:40], scale = c(5, 0.5), 
          colors = brewer.pal(8, "Dark2"))

# Convert the date column to a date-time format
tweets$date <- as.POSIXct(tweets$date, format = "%Y-%m-%d %H:%M:%S", tz = "GMT")

# Create a histogram of tweet frequency by hour
hist(hour(tweets$date), breaks = 24, xlab = "Hour of day", ylab = "Frequency", 
     main = "Tweet frequency by hour")

# Add a vertical line to indicate the start of breakfast time
abline(v = 6, col = "red", lwd = 2)

# Add a vertical line to indicate the end of breakfast time
abline(v = 10, col = "red", lwd = 2)
# Extract the month and year from the date-time stamp of each tweet
tweets$month <- format(tweets$date, "%m")
tweets$year <- format(tweets$date, "%Y")

# Aggregate the number of tweets by month and year
tweets_per_month <- aggregate(id ~ year + month, data = tweets, FUN = length)

# Rename the columns
colnames(tweets_per_month) <- c("Year", "Month", "Tweets")

# Print the resulting dataframe
print(tweets_per_month)

# Load libraries
library(tm)
library(dplyr)


# Filter tweets by source = "iPhone"
iphone_tweets <- tweets[tweets$source == "iPhone",]

# Create a corpus from the text of the tweets
iphone_corpus <- Corpus(VectorSource(iphone_tweets$text))

# Remove empty documents
iphone_corpus <- tm_filter(iphone_corpus, function(x) length(x) > 0)

# Convert all text to lowercase
iphone_corpus <- tm_map(iphone_corpus, content_transformer(tolower))

# Remove punctuation
iphone_corpus <- tm_map(iphone_corpus, removePunctuation)

# Remove numbers
iphone_corpus <- tm_map(iphone_corpus, removeNumbers)

# Remove common English stop words
iphone_corpus <- tm_map(iphone_corpus, removeWords, stopwords("english"))

# Create a document-term matrix
iphone_dtm <- DocumentTermMatrix(iphone_corpus)

# Convert the document-term matrix to a data frame
iphone_df <- as.data.frame(as.matrix(iphone_dtm))

# Calculate the frequency of each word in the corpus
iphone_word_freq <- colSums(iphone_df)

# Convert the results to a data frame
iphone_word_freq_df <- data.frame(word = names(iphone_word_freq), freq = iphone_word_freq)

# Get the top 15 words
top_iphone_words <- head(arrange(iphone_word_freq_df, desc(freq)), 15)

# Filter tweets by source = "Media Studio"
media_tweets <- tweets[tweets$source == "Media Studio",]

# Create a corpus from the text of the tweets
media_corpus <- Corpus(VectorSource(media_tweets$text))

# Remove empty documents
media_corpus <- tm_filter(media_corpus, function(x) length(x) > 0)

# Convert all text to lowercase
media_corpus <- tm_map(media_corpus, content_transformer(tolower))

# Remove punctuation
media_corpus <- tm_map(media_corpus, removePunctuation)

# Remove numbers
media_corpus <- tm_map(media_corpus, removeNumbers)

# Remove common English stop words
media_corpus <- tm_map(media_corpus, removeWords, stopwords("english"))

# Create a document-term matrix
media_dtm <- DocumentTermMatrix(media_corpus)

# Convert the document-term matrix to a data frame
media_df <- as.data.frame(as.matrix(media_dtm))

# Calculate the frequency of each word in the corpus
media_word_freq <- colSums(media_df)

# Convert the results to a data frame
media_word_freq_df <- data.frame(word = names(media_word_freq), freq = media_word_freq)

# Get the top 15 words
top_media_words <- head(arrange(media_word_freq_df, desc(freq)), 15)

# Print the top 15 words for each source
cat("Top 15 words for source = 'iPhone':\n")
print(top_iphone_words)
cat("\n")
cat("Top 15 words for source = 'Media Studio':\n")
print(top_media_words)

# subset the dataframe to only include the first and last six months
start_date <- as.Date("2018-01-01")
end_date <- as.Date("2018-06-30")
tweets_df1 <- tweets_df %>%
  filter(date >= start_date & date <= end_date)

start_date2 <- as.Date("2018-07-01")
end_date2 <- as.Date("2018-12-31")
tweets_df2 <- tweets_df %>%
  filter(date >= start_date2 & date <= end_date2)

# get the top 10 most frequent words for each six-month period
top_words1 <- colnames(tweets_df1)[order(colSums(tweets_df1), decreasing = TRUE)][1:10]
top_words2 <- colnames(tweets_df2)[order(colSums(tweets_df2), decreasing = TRUE)][1:10]

# identify the six words that were in the top 10 for the first six months but not the last six months
not_used_words <- setdiff(top_words1, top_words2)

# print the six words
print(not_used_words)


#question 2
library(readxl)
client_analysis_question_2 <- read_excel("C:/r/client_analysis question 2.xlsx")
View(client_analysis_question_2)
# Create time series plot
> plot(x = client_analysis_question_2$Month,
       y = client_analysis_question_2$SmartBear,
       type = "l",
       col = "red",
       ylim = range(client_analysis_question_2[,2:7]),
       xlab = "Month",
       ylab = "Spend",
       main = "Spend Changes from Month to Month")




