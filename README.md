# Tourism Insights
## Project Overview
The purpose of this project is to analyze the correlation between the economic indicators of a country and its influence on the type of tourism (Personal vs Business) at a global level to help the Itinerary Preparation Department of Travelpedia design travel packages.

## Introduction
Tourism is emerging as one of the noticeable growing sectors. It plays a key role in boosting a country's economy and can have a positive influence on the economic outcomes of a nation such as increase in GDP and business opportunites. For our study, we analyzed the tourist influx data and economic indicators during the period from 2000-2012 for different countries. The data was collected from various sources as mentioned in **Data Source**. Following are the questions we are trying to answer from our analysis.

- Is there a relation between the economic indicators and tourism type in a country?
- Which are the countries with heavy Personal tourism?
- Which are the countries with heavy Business tourism?

## Data Source
For our project, we analysed the data obtained from the following sources.
- **UNWTO**
    - The dataset from UNWTO compiles figures from national and international institutions including national tourism administrations, national statistical offices and central          banks and border statistics. 
      https://www.unwto.org/statistic/basic-tourism-statistics
- **World Economic Indicators dataset from Kaggle database**
    - This dataset includes some of the important indicators such as Life Expectancy, Ease of doing Business, Population, Tourism etc that drives the global economy. It has been       obtained from the United Nations. 
      https://www.kaggle.com/bhatvikas/world-tourism-economic-data
    
## Team Details
### Team Members
- Chinnu Muthu
- Loulwa Alkaisi
- Robert Gallagher

### Communication Protocols
- The team had Zoom meeting through the week to follow-up with the progress of the project.
- Additional details were communicated through Slack

## Data Exploration Phase
During the exploration phase, the data was cleaned using Python and MS Excel to be fed through the Machine Learning Models. The cleaned data was combined on the fields *Country* and *Year* and filtered for the year 2000 to make an initial analysis. Logistic Regression was then performed on the dataset to identify the Type of Tourism (Personal vs Business) that was prominent in the country.

## Data Cleaning and PreProcessing
Tables were created in PostgreSQl to store the static data for analyis. Both the datasets were cleaned and combined on the field *Country* and *Year*. The data was then joined and loaded into the merged table for further analysis.
In the data preprocessing step, the merged dataset with missing data was cleaned using Python to drop the null values. The cleaned dataset had a total of 1269 rows.

### Feature Elimination and Extraction
The features that were not relevant to the analysis was eliminated so the model won't be run using every column. In this process, the features *country, no_of_records, population_total, region, total, header, year* were dropped.

Feature extraction combines all the features into a new set that is ordered by how well they predict the original variable.

## Presentation Link
Link for the Presentation -> https://docs.google.com/presentation/d/1WWHkNJUJ9FnploBvIQPVICQ6DHv31jZqr6gERvlPQ9Y/edit#slide=id.gc6f980f91_0_0


