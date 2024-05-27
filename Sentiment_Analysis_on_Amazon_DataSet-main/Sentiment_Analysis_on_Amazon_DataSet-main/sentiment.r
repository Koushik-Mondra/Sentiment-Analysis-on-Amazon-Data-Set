library(data.table)
library(dplyr)
library(tidyr) # data manipulation
library(tidytext)
library(tokenizers)
library(wordcloud)
library(textstem)
library(ggplot2)
library(wordcloud2)
library(tidyverse)


set.seed(5152)
kindle <- read.csv("C://Users//Akhil//Downloads//kindle_reviews.csv")
View(kindle)

#getSources()


# take sample data to reduce computation time
set.seed(123)
kindle<-sample_n(kindle,50)

print(kindle)

# rename colnames to match the requirements of dataframe source to create corpus
kindle<- kindle %>%
  rename(doc_id = asin,
         text = reviewText)
head(kindle)

#install.packages("tm")
library(tm)

# create corpus
review_corpus <- VCorpus(DataframeSource(kindle))
head(review_corpus)
print(review_corpus)

## Step 1: Eliminating extra whitespace
review_corpus<- tm_map(review_corpus, stripWhitespace)

## Step 2: Transform to lowercase
review_corpus<- tm_map(review_corpus, content_transformer(tolower))

## remove punctuation
review_corpus<- tm_map(review_corpus, removePunctuation)
print(review_corpus)

## remove numbers
review_corpus<- tm_map(review_corpus, removeNumbers)

# remove stopwords
review_corpus<- tm_map(review_corpus, removeWords, stopwords("english"))

# OR: creating and using custom stopwords in addition
mystopwords<- c(stopwords("english"),"book","people")
review_corpus<- tm_map(review_corpus, removeWords, mystopwords)

library(data.table)
library(dplyr)
library(tidyr) # data manipulation
library(tidytext)
library(tokenizers)
library(wordcloud)
library(textstem)
library(ggplot2)

library(wordcloud2)

# Lemmatize the words in the review_corpus

review_corpus <- tm_map(review_corpus, lemmatize_strings)
review_corpus<- tm_map(review_corpus, PlainTextDocument)
head(review_corpus)
print(review_corpus)

# create term document matrix
tdm<- TermDocumentMatrix(review_corpus, control = list(wordlengths = c(1,Inf)))

# inspect frequent words
freq_terms<- findFreqTerms(tdm, lowfreq=50)
term_freq<- rowSums(as.matrix(tdm))
df<- data.frame(term = names(term_freq), freq = term_freq)

head(df)

View(df)

library(textdata)

get_sentiments("afinn")
get_sentiments('bing')
get_sentiments('nrc')

kindle_s<- df %>%
  inner_join(get_sentiments('bing'),by=c(term='word'))
view(kindle_s)

kindle_s1<- df %>%
  inner_join(get_sentiments("afinn"),by=c(term='word'))
view(kindle_s1)

kindle_s2<- df %>%
  inner_join(get_sentiments('nrc'),by=c(term='word'))
view(kindle_s2)

library(dplyr)
library(ggplot2)
bar_plot <- kindle_s2 %>%
  group_by(sentiment) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = sentiment, y = count, fill = sentiment)) +
  geom_bar(stat = "identity") +
  labs(title = "Sentiment Distribution for Kindle Data",
       x = "Sentiment",
       y = "Frequency") +
  theme_minimal() +
  theme(legend.position = "none")
print(bar_plot)
