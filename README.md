Introduction

This project provides an understanding of the data from a made up hpusing company. The data to be understand, do a quality check and do an initial exploratory data analysis. Before building any statistical model, by doing all the initial analysis will give us a better picture on what all needs to be done and carried forward.

Data Survey

Usually, the data survey provides us a good picture on following questions
1.	What data do we have? And what it is supposed to represent?
2.	Do we have right data to properly address our problem?
3.	What kinds of problem can we properly address given the data we have?

What Data? And what it is supposed to represent?
The data is related to property sales with 80 variables of data. The 80 variables focus on the quality and quantity of many physical attributes of the property. Most of the variables are exactly the type of information that a typical home buyer would want to know about a potential property (e.g. When was it built? How big is the lot? How many square feet of living space is in the dwelling? Is the basement finished? How many bathrooms are there?)
There are a large number of categorical variables (23 nominal, 23 ordinal) associated with this data set. They range from 2 to 28 classes with the smallest being STREET (gravel or paved) and the largest being NEIGHBORHOOD (areas within the Ames city limits). The nominal variables typically identify various types of dwellings, garages, materials, and environmental conditions while the ordinal variables typically rate various items within the property. The coding within the original data typically utilized an eight-character name that was relevant to the classification but some of the original class levels were difficult to interpret. For ease of use many class levels were recoded into slightly more usable forms

Do we have right data to properly address our problem?
I think we have decent set of data to work on any basic analysis to understand the sales, purchase behavior. The selection of houses, plots, budget spent, the number of times people went beyond market price (say median/range) to buy house. Number of houses that were purchased that are more than normal size. To understand the behavior, pattern and understanding the market trend, the data gathered and obtained can help us easily. We have the right data to work.

What kind of problem can we properly address given the data we have?
Using the data, we can work on regression problems, problems related to analysis of purchases and sales and problems like predicting the sales behavior. Data also helps us understand the how the sales happened, when was real estate business was on boom and during when people went beyond normal range and purchased, etc.. 

Quality Check

The quality of the data looks good. But there are some records that may not be valid and might have been errors. 
1.	There are 11 records whose SalePrice is less than $50,000
proc print data=mydata.ames_housing_data;
where SalePrice < 50000;
run; quit;

2.	There are records whose Total Basement Sq Feet is 0
proc print data=mydata.ames_housing_data;
where TotalBsmtSF =0;
run; quit;

But, other parameters like Neighbourhood, Lot Shape, etc are as per data dictionary. So, other than some records, the overall data quality looks good.

Exploratory Data Analysis

For us to find the possible estimates of home values for typical homes. We will be using the procedures like MEANS, UNIVARIATE and FREQ
We will be running procedure UNIVARIATE, we will be generating the statistics and graphs describing the distribution of a single variable. The statistics include the mean, median, mode, standard deviation, skewness and kurtosis. 
SalePrice
By running the UNIVARIATE with the variable SalePrice, the following stats and graph is generated.

Code 
proc univariate data=mydata.ames_housing_data;
var SalePrice;
histogram SalePrice / Normal;
run; quit;

Output
N = Number of houses sold
Mean = Mean for the SalesPrice of the houses that are sold
Std Deviation = Standard Deviation for the Sale Price

![image](https://user-images.githubusercontent.com/52735742/72699902-4e22da80-3b9e-11ea-8828-a6ce2187bfdb.png)

Median: Median for the distribution of the Sales Price data
Range: Range of the distribution of SalesPrice Data

![image](https://user-images.githubusercontent.com/52735742/72699972-862a1d80-3b9e-11ea-9a2b-4c79511258f9.png)


Below table tells the median for each quantile. 

![image](https://user-images.githubusercontent.com/52735742/72700122-06508300-3b9f-11ea-9cf8-6660165c3f95.png)


Below are list of extreme observations. 
![image](https://user-images.githubusercontent.com/52735742/72700171-297b3280-3b9f-11ea-9613-e97be3fe4316.png)


![image](https://user-images.githubusercontent.com/52735742/72700052-c7bac880-3b9e-11ea-9d08-ef0699f0a2fc.png) 

![image](https://user-images.githubusercontent.com/52735742/72700265-84148e80-3b9f-11ea-92a5-7c7f278ddd2b.png)


Years Sold
Below is the frequency of the number of houses sold each year. Highest percentage of houses were sold in 2007. And lost was in 2010. There is increase in one year and decrease in next year.
If the same patter follow, 2011 may have increase in sales of house 
This one is using the procedure FREQ
Code 
proc FREQ data=mydata.ames_housing_data;
tables YrSold;
run; quit;

![image](https://user-images.githubusercontent.com/52735742/72700562-4ebc7080-3ba0-11ea-9a3e-0eab4c2ffd9b.png)


Neighborhood
Find the prices of house in each neighborhood. 
For this, use the MEANS procedure

Code

proc means data=mydata.ames_housing_data min mean median max;
class neighborhood;
var SalePrice;
run; quit;

Output
This covers the mean, median, minimum and maximum prices of houses that are sold. 
Analysis Variable : SalePrice
![image](https://user-images.githubusercontent.com/52735742/72700623-7d3a4b80-3ba0-11ea-9757-88c5d22fdc0b.png)


Neighborhood: SGPLOT
We can generate a histogram to see the number of houses sold in each neighbourhood.
Code
proc sgplot data=mydata.ames_housing_data;
vbar Neighborhood / group=LotShape;
run;quit;
Output

 ![image](https://user-images.githubusercontent.com/52735742/72700656-96db9300-3ba0-11ea-8b1f-c0236bc45e1b.png)

MOSOLD: SGPLOT
To know the time period in year when most of the houses sold. It helps to find best month when the customers are willing to sold and when will there be a lot rate in sold. 
Code
proc sgplot data=mydata.ames_housing_data;
vbar MoSold/ group=LotShape groupdisplay=cluster;
run;quit;

Output
![image](https://user-images.githubusercontent.com/52735742/72700688-b672bb80-3ba0-11ea-9e2d-1f2b243023a9.png)


Neighborhood, Sale Price: Scatter Plot
We can see the scatter plot for Sales Price grouping by neighborhood. 
The procedure for this is SGPLOT and the parameter is SCATTER
Code
proc sgplot data=mydata.ames_housing_data;
scatter x=neighborhood y=SalePrice;
run; quit;

Output
![image](https://user-images.githubusercontent.com/52735742/72700724-d73b1100-3ba0-11ea-81d4-16db89f71732.png)

 
Neighborhood, Boxplot
To find the outliers of the sale prices, we can run the box plot with a horizontal bars. 
The graph shows the outliers of prices for each neighborhood. 
The procedure used for this is SGPLOT with hbox parameter.
Code
proc sgplot data=mydata.ames_housing_data;
hbox SalePrice / category=neighborhood transparency=0.75; *Try 0.75 and 0.25;
run; quit;

Output
![image](https://user-images.githubusercontent.com/52735742/72700883-6e07cd80-3ba1-11ea-8136-9be7364e17ed.png)





Give Live Area, Sale Price: Regression and LOESS
We can get a view of regression and LOESS by using the procedure SGPLOT with the reg and loess parameters
Code
proc sgplot data=mydata.ames_housing_data;
reg x=GrLivArea y=SalePrice / clm;
loess x=GrLivArea y=SalePrice / nomarkers;
run; quit;


Output
![image](https://user-images.githubusercontent.com/52735742/72700899-7eb84380-3ba1-11ea-8986-cdee1ffaab16.png)
 
