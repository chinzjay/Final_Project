# Tourism Insights
## Project Overview
Travelpedia is a private travel agency that offers travel and tourism related services to different countries. Thep provide package tours for each destinations. The purpose of our project is to help the Itinerary Preparation Department of Travelpedia design global travel packages by analyzing the correlation between the economic indicators of a country and its influence on the type of tourism (Personal vs Business).

## Introduction
Tourism is emerging as one of the noticeable growing sectors. It plays a key role in boosting a country's economy and can have a positive influence on the economic outcomes of a nation such as increase in GDP and business opportunites. For our study, our team analyzed the tourist influx data from different regions of the world and economic indicators during the period from 2000-2012 for different countries. The data was collected from UNWTO and Kaggle. Following are the questions we are trying to answer from our analysis.

- Is there a relation between the economic indicators and tourism type in a country?
- Which are the countries with heavy Personal tourism?
- Which are the countries with heavy Business tourism?

## Team Details
### Team Members
- Chinnu Muthu
- Loulwa Alkaisi
- Robert Gallagher

### Communication Protocols
- Our team collaborated  through virtual meetings during the week to discuss roles, address issues and work towards the project outcome.
- Additional details were communicated through Slack.

## Data Source
For our project, we analyzed the data obtained from the following sources.
- **UNWTO**
    - The dataset from UNWTO compiles figures from national and international institutions including national tourism administrations, national statistical offices and central          banks and border statistics. 
      https://www.unwto.org/statistic/basic-tourism-statistics
- **World Economic Indicators dataset from Kaggle database**
    - This dataset includes some of the important indicators such as Life Expectancy, Ease of doing Business, Population, Tourism etc that drives the global economy. It has been       obtained from the United Nations. 
      https://www.kaggle.com/bhatvikas/world-tourism-economic-data
    
## Data Exploration Phase
During the initial exploration phase, the data was cleaned using Python and MS Excel to be used for the Machine Learning Models. The cleaned data was combined on the fields *Country* and *Year* and filtered for the year 2000 to make an initial analysis. Logistic Regression was then performed on the dataset to identify the Type of Tourism (Personal vs Business) that was popular in the country.

## Data Cleaning and PreProcessing
Tables were created in PostgreSQl to store the static data for analyis. Both the datasets were cleaned and combined on the fields *Country* and *Year*. The data was then joined and loaded into the merged table for further analysis.
In the data preprocessing step, the merged dataset from PostgreSQL was imported into Jupyter notebook and the rows with missing data were cleaned and the null values were dropped. The cleaned dataset had a total of 1269 rows.

### Feature Elimination
The features that were not relevant to the analysis were eliminated so the model won't be run using every column. In this process, the features *country, no_of_records, population_total, region, total, header, year* were dropped.

## Machine Learning Model
We performed the following Machine Learning Models for our data analysis.
- Logistic Regression to predict the kind of tourism prominent in the country
- Linear Regression to predict the percentage of Personal Tourism

### Logistic Regression
Logistic Regression is a supervised learning model that is used for predicting binary outcomes. The dependent variable is categorical in this approach. It is used in statistics and machine learning to understand the relationship between the dependent variable and one or more independent variables by estimating probabilities using a logistic regression equation. This type of analysis can help predict the probability of an event happening. In our case, it is used to predict what type of tourism is more likely in a country. The analysis looks at Personal tourists, Business tourists, number of visitors from various regions (Africa, Americas, East Asia and Pacific, Europe, Middle East), Population of different age groups (65+, 15-64, 0-14), Urban Population, Inbound Tourism, Outbound Tourism (Indepepndent variables).
The information from the analysis can be used by the Itinerary Preparation Department to develop appropriate travel packages for various countries.

- The dataset(features and target) was split into test and train sets using the train_test_split() function.
- A logistic regression model was created. LogisticRegression was imported from the Scikit-learn library, and then the model was instantiated. 
- The model was then trained with the training data using fit() method.
- Predictions were made using predict() method on X_test and the results were assembled into  *results* DataFrame.
- The model was then validated with the accuracy score. 

#### Results
Our model had an accuracy score of 87.10%. This means that  observations in the testing set was predicted correctly 87% by the model. 

### Linear Regression


## Presentation Link
Link for the Presentation -> https://docs.google.com/presentation/d/1WWHkNJUJ9FnploBvIQPVICQ6DHv31jZqr6gERvlPQ9Y/edit#slide=id.gc6f980f91_0_0


