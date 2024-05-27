# Sentiment_Analysis_on_Amazon_DataSet


## Table of Contents
- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Installation](#installation)
- [Usage](#usage)
- [Results](#results)
- [Contributing](#contributing)
- [Contact](#contact)

## Project Overview
This project focuses on analyzing customer sentiments from Amazon Kindle reviews using natural language processing (NLP) techniques in R. The sentiment analysis classifies reviews as positive, negative, or neutral, providing valuable insights into customer satisfaction and feedback trends.

## Dataset
The dataset used in this project is the Amazon Kindle customer review dataset. It contains customer reviews on various Kindle products, including features such as review text and ratings.

### Dataset Structure
- `asin`: Product identifier
- `reviewText`: Text of the review
- `overall`: Rating given by the customer (1-5 stars)

## Installation
To set up the environment for running the sentiment analysis, you need to have R installed along with several R packages.

1. **Install R:** Download and install R from [CRAN](https://cran.r-project.org/).

2. **Install R Packages:** Open R or RStudio and run the following commands to install the necessary packages:
    ```R
    install.packages("data.table")
    install.packages("dplyr")
    install.packages("tidyr")
    install.packages("tidytext")
    install.packages("tokenizers")
    install.packages("wordcloud")
    install.packages("textstem")
    install.packages("ggplot2")
    install.packages("wordcloud2")
    install.packages("tm")
    install.packages("textdata")
    ```

## Usage
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/amazon-sentiment-analysis.git
   cd amazon-sentiment-analysis
   ```

2. **Prepare the Dataset:**
   - Download the Kindle review dataset.
   - Place the dataset file (e.g., `kindle_reviews.csv`) in the project directory.

3. **Run the Analysis:**
   - Open the R project or the R script file (`sentiment_analysis.R`) in RStudio.
   - Execute the script to perform sentiment analysis:
     ```R
     source("sentiment_analysis.R")
     ```

### Detailed Steps in the Script
1. **Load Libraries:** Load necessary R libraries for data manipulation and visualization.
2. **Read and Sample Data:** Read the Kindle review data and take a sample to reduce computation time.
3. **Data Preprocessing:**
   - Rename columns for corpus creation.
   - Create a text corpus and perform text cleaning (remove whitespace, convert to lowercase, remove punctuation, numbers, and stopwords).
   - Lemmatize words in the corpus.
4. **Term Document Matrix:** Create a Term Document Matrix (TDM) and find frequent terms.
5. **Sentiment Analysis:** Perform sentiment analysis using different sentiment lexicons (`bing`, `afinn`, `nrc`).
6. **Visualization:** Create a bar plot to visualize sentiment distribution.

## Results
The sentiment analysis results include:
- **Frequent Terms:** A data frame of frequent terms and their frequencies.
- **Sentiment Data:** Data frames containing terms with their associated sentiments from different lexicons.
- **Visualization:** A bar plot showing the sentiment distribution of the reviews.

## Contributing
Contributions are welcome! If you would like to contribute to this project, please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.


## Contact
If you have any questions or suggestions, feel free to contact me at:
- Email: palukuriakhil1@gmail.com
- GitHub: 2110030166Akhil

---

Feel free to adjust the details such as the dataset source link, contact information, and any specific instructions according to your project.
