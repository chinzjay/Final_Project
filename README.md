# Tourism Predictions
## Project Overview
Travelpedia is a private travel agency that offers travel and tourism related services to different countries. They provide package tours for each destinations. The purpose of our project is to help the Itinerary Preparation Department of Travelpedia design global travel packages by analyzing the correlation between the economic indicators of a country and type of tourism (Personal, Business).

## Introduction
Tourism is emerging as one of the noticeable growing sectors. It plays a key role in boosting a country's economy and can have a positive influence on the economic outcomes of a nation such as increase in GDP and business opportunites. For our study, our team analyzed the tourist influx data from different regions of the world and economic indicators during the period from 2000-2012 for different countries. The data was collected from UNWTO and Kaggle. 

Following are the objectives of our project.
- Analysis of economic indicators and type of (personal, business) tourism in a country.
- Personal and business travel predictions. 

## Team Details
### Team Members
- Chinnu Muthu
- Loulwa Alkaisi
- Robert Gallagher

## Data Source
For our project, we analyzed the data obtained from the following sources.
- **UNWTO**
    - The dataset from UNWTO compiles figures from national and international institutions including national tourism administrations, national statistical offices and central          banks and border statistics. [Here](https://www.unwto.org/statistic/basic-tourism-statistics) is the link to UNWTO dataset.
- **World Economic Indicators dataset from Kaggle database**
    - This dataset includes some of the important indicators such as Life Expectancy, Ease of doing Business, Population, Tourism etc that drives the global economy. It has been       obtained from the United Nations. [Here](https://www.kaggle.com/bhatvikas/world-tourism-economic-data) is the link to Economic Indicators dataset.

## Technologies 
- Data was initially cleaned using **Excel, Macros** and **Python**. *Fig1* shows code snippet of basic cleaning on the data using macros

![Excel_Macro_Screen_Shot.png](https://github.com/chinzjay/Final_Project/blob/main/Resources/Images/Excel_Macro_Screen_Shot.png)
|:--:|
|Fig 1. Code snipet of cleaning using macros|

- Initial data ([Economic indicators](Resources/clean_inbound_data_thousands.csv), [Inbound tourism)](Resources/clean_world_ind.csv) was imported into tables in **PostgreSQL**.
- The data was then connected to [**Jupyter Notebook**](Tourism.ipynb) and **Machine Learning** models were implemented.
- Interactive dashboards were created using **Tableau** to present the data story.
- Presentation was drafted using **Google Slides**.
    
## Data Exploration Phase
During the initial exploration phase, the data was cleaned using Python and MS Excel to be used for the Machine Learning Models. The cleaned data was combined on the fields *Country* and *Year* and filtered for the year 2000 to make an initial analysis. The data was visualized using Tableau worksheets and Seaborn for further understanding of the data. Logistic Regression was then performed on the dataset to identify the Type of Tourism (Personal vs Business) that was popular in the country. 

## Database, Data Cleaning and Preprocessing
Database was created in PostgreSQL and stored in Amazon Web Services (AWS) to store the static data for analyis. Tables were created based on the designed [Entity Relationship Diagram](database/ERD.png) (ERD). ERDs are created based on three basic concepts: entities, attributes and relationships. The two tables *inbound_tourism* and *world_indicators* were implemented into the database in PostgreSQL. Both the tables were merged using joins to the *merged_data* table *(Fig2)* on the columns *Country* and *Year*. 

![merged_data.PNG](https://github.com/chinzjay/Final_Project/blob/main/Resources/Images/merged_data.PNG)
|:--:|
|Fig 2. Merged_data using joins in PostgreSQL|

The tables were configured using [this](database/schema.sql) schema. 
The data is connected to [Jupyter Notebook](Tourism.ipynb) using connection string.
In the data preprocessing step, the null values were dropped. The final cleaned dataset for the Machine Learning model had a total of 1269 rows. The merged dataset has a total of 31 columns.

### Data Exploration and Feature Selection
#### Data Exploration
**Seaborn** is a Python data visualization library based on matplotlib. It provides a high-level interface for drawing attractive and informative statistical graphics. 
It was used to plot pairwise relationships for the dataset. By default, this function creates a grid of axis so that each numeric variable in data is shared across the y-axis across a single row and the x-axes across a single column. [Here](Resources/Images/pairplot.png) is the visualization plotted using our dataset. 

#### Feature Selection
The correlation between the attributes were determined using corr() function. It is used to find the pairwise correlation of all columns in the dataframe. The features with  threshold of over 0.2 was chosen for the classification. 
The **features** for the model are the economic indicators of a country including GDP, Population, Population of different age groups (65+, 15-64, 0-14), Urban Population, Inbound Tourism, Outbound Tourism etc. The features not relevant to the analyzis were eliminated so the model won't be run using every column. In this process, the features *country, no_of_records, population_total, region, total, header, year* were dropped.
The **target** for our Logistic Regression model is higher_tourism (Personal or Business tourism).

### Training and Testing Sets
Scikit-learn is the machine learning library for the Python. Using train_test_split() from scikit-learn, the dataset was split into subsets: *training* and *testing* datasets for evaluation and validation of the Machine Learning model. Following is the split of the training and testing dataset.
- Training set : 951 train samples (75% ) 
- Testing set : 318 test samples (25%) 

## Machine Learning Model
The following Machine Learning Models were performed for our data analysis.
- `Logistic Regression` to predict the kind of tourism prominent in the country
- `Linear Regression` to predict the percentage of Personal Tourism

### Logistic Regression
Logistic Regression is a supervised learning model that is used for predicting binary outcomes. The dependent variable is categorical in this approach. It is used in statistics and machine learning to understand the relationship between the dependent variable and one or more independent variables by estimating probabilities using a logistic regression equation. This type of analysis can help predict the probability of an event happening. 
In our case, it is used to predict what type of tourism is more likely in a country. The analysis looks at Personal tourists, Business tourists, number of visitors from various regions (Africa, Americas, East Asia and Pacific, Europe, Middle East), Population of different age groups (65+, 15-64, 0-14), Urban Population, Inbound Tourism, Outbound Tourism etc (Independent variables).

- The dataset (features and target) was split into test and train sets using the train_test_split() function.
- Scikit-learn's StandardScaler module was used to standardize numerical data.
- Logistic regression model was created. LogisticRegression was imported from the Scikit-learn library, and then the model was instantiated. 
- The model was then trained with the training data using fit() method.
- Predictions were made using predict() method on X_test and the results were assembled into  *results* DataFrame.
- The model was then validated with the accuracy score. 

#### Results
The model has an accuracy score of 84.90%. This means that 85% of the observations in the testing set were predicted correctly by the model. In addition, confusion matrix was  generated to visualize the performance of the model. The table below summarizes the confusion matrix.

|           |  Business | Personal |
| --------- |  -------- | -------- |
| Business  |    136    |    30    |
| Personal  |     18    |   134    |

To evaluate the model further, classification report was generated for the model to measure the quality of predictions. The classification report was visualized using heatmaps using Seaborn library and can be found [here](Resources/Images/logreg_conf_matrix.png).

Heatmap of the confusion matrix was generated using heatmap() in Seaborn (*Fig3*).

![logreg_conf_matrix.png](https://github.com/chinzjay/Final_Project/blob/main/Resources/Images/logreg_conf_matrix.png)
|:--:|
|Fig 4. Heatmap of confusion matrix|

- **Precision** is the ability of a classifier not to label an instance positive that is actually negative. For each class it is defined as the ratio of true positives to the sum of true and false positives. Our model has a precision score of 0.88 for Business and 0.82 for Personal.
- **Recall** is the ability of a classifier to find all positive instances. For each class it is defined as the ratio of true positives to the sum of true positives and false negatives. Our model has a precision score of 0.82 for Business and 0.88 for Personal.
- **F1 score** is a weighted harmonic mean of precision and recall such that the best score is 1.0 and the worst is 0.0. Generally speaking, F1 scores are lower than accuracy measures as they embed precision and recall into their computation. Our model has a high F1 score of 0.85.

#### Benefits of Logistic Regression
- Logistic regression is much easier to set up and train than other machine learning models.
- When data is linearly separable, it is one of the most eficient algorithms.

#### Limitations of Logistic Regression
- On high dimensional datasets, there is a high probability of overstating the accuracy of predictions on the training set and thus the model may not be able to predict accurate results on the test set.
- It is difficult to capture complex relationships.
- Logistic Regression requires moderate or no multicollinearity between independent variables. 

### Linear Regression
Linear Regression is a supervised learning model that is used for finding linear relationship between target (dependent variable) and independent variables. The case of more than one feature is called as multiple linear regression.

- The dataset (features and target) was split into test and train sets using the train_test_split() function.
- Instance of the linear regression model was created from sklearn.linear_model's LinearRegression class.
- Data was analyzed to learn patterns in the training stage.
- Predict() method was used to generate predictions on the test dataset (X_test).

#### Results
The model has Root Mean Square Error (RMSE) of 11.27. RMSE is the standard way to measure the error of a model in predicting quantitative data. It shows how far predictions fall from measured true values using Euclidean distance. 

#### Benefits of Linear Regression
- It is a very efficient model and is easy to train.
- Modeling speed is fast and the predictions run fast with large amount of data.

#### Limitations of Linear Regression
- It is highly affected by outliers.
- It is prone to overfitting if there is not much data.
- Multicollinearity should be removed before performing linear regression.

### Changes in Model Choice
Additional Machine Learning model were created to identify the best choice for analysis. Following are the additional models that were performed.
- Support Vector Machine (SVM)
- Decision Trees
- Linear Regression after performing PCA for feature reduction
Since the above models did not improve the model performance we went with the model choices in `Machine Learning` Section

## Dashboard
The visualizations were developed in Tableau and can be found [here](https://public.tableau.com/app/profile/robert.gallagher7587/viz/Tourism_by_Country/TourismandtheEconomy?publish=yes)

## Presentation Link
The final analysis was drafted as a presentation using Google Slides. (*Fig4*)

![ppt.PNG](https://github.com/chinzjay/Final_Project/blob/main/Resources/Images/ppt.PNG)
|:--:|
|Fig 4. Presentation in Google Slides|

Click [here](https://docs.google.com/presentation/d/1k5R6Y6H7YV5wrKwUlMa-w-3UOf1p8Hi-BeB8QYGhnyo/edit#slide=id.gc6f980f91_0_81) for the Presentation link.


