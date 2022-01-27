# Tourism Insights
## Project Overview
Travelpedia is a private travel agency that offers travel and tourism related services to different countries. They provide package tours for each destinations. The purpose of our project is to help the Itinerary Preparation Department of Travelpedia design global travel packages by analyzing the correlation between the economic indicators of a country and its influence on the type of tourism (Personal vs Business).

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
- Scikit-learn's StandardScaler module was used to standardize numerical data.
- A logistic regression model was created. LogisticRegression was imported from the Scikit-learn library, and then the model was instantiated. 
- The model was then trained with the training data using fit() method.
- Predictions were made using predict() method on X_test and the results were assembled into  *results* DataFrame.
- The model was then validated with the accuracy score. 

#### Results
Our model had an accuracy score of 87.10%. This means that  observations in the testing set was predicted correctly 87% by the model. 

#### Benefits of Logistic Regression
- Logistic regression is much easier to set up and train than other machine learning models.
- When data is linearly separable, it is one of the most eficient algorithms.

#### Limitaions of Logistic Regression
- On high dimensional datasets, there is a high probability of overstating the accuracy of predictions on the training set and thus the model may not be able to predict accurate results on the test set.
- It is difficult to capture complex relationships.
- Logistic Regression requires moderate or no multicollinearity between independent variables. 

### Linear Regression
Linear Regression is a supervised learning model that is used for finding linear relationship between target (dependent variable) and independent variables. The case of more than one feature is called as multiple linear regression.

- The dataset(features and target) was split into test and train sets using the train_test_split() function.
- Scikit-learn's StandardScaler module was used to standardize numerical data.
- Instance of the linear regression model was created from sklearn.linear_model's LinearRegression class.
- Data was analyzed to learn patterns in the training stage.
- Predict() method was used to generate predictions on the test dataset (X_test).

#### Benefits of Linear Regression
- It is a very efficient model and is easy to train.
- Modeling speed is fast and the predictions run fast with large amount of data.

#### Limitations of Linear Regression
- It is highly affected by outliers.
- It is prone to overfitting if there is not much data.
- Multicollinearity should be removed before performing linear regression.

## Dashboard
https://public.tableau.com/app/profile/robert.gallagher7587/viz/Tourism_by_Country/TourismandtheEconomy

## Presentation Link
Link for the Presentation -> https://docs.google.com/presentation/d/1WWHkNJUJ9FnploBvIQPVICQ6DHv31jZqr6gERvlPQ9Y/edit#slide=id.gc6f980f91_0_0


