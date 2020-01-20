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



Moments
N	2930	Sum Weights	2930
Mean	180796.06	Sum Observations	529732456
Std Deviation	79886.6924	Variance	6381883616
Skewness	1.74350008	Kurtosis	5.11889995
Uncorrected SS	1.14466E14	Corrected SS	1.86925E13
Coeff Variation	44.1860803	Std Error Mean	1475.8446

Median: Median for the distribution of the Sales Price data
Range: Range of the distribution of SalesPrice Data

Basic Statistical Measures
Location	Variability
Mean	180796.1	Std Deviation	79887
Median	160000.0	Variance	6381883616
Mode	135000.0	Range	742211
		Interquartile Range	84000

Below table tells the median for each quantile. 
Quantiles (Definition 5)
Level	Quantile
100% Max	755000
99%	457347
95%	335000
90%	281357
75% Q3	213500
50% Median	160000
25% Q1	129500
10%	105250
5%	87500
1%	61500
0% Min	12789



Below are list of extreme observations. 
Extreme Observations
Lowest	Highest
Value	Obs	Value	Obs
12789	182	611657	45
13100	1554	615000	1064
34900	727	625000	2446
35000	2844	745000	1761
35311	2881	755000	1768

 

Goodness-of-Fit Tests for Normal Distribution
Test	Statistic	p Value
Kolmogorov-Smirnov	D	0.1234216	Pr > D	<0.010
Cramer-von Mises	W-Sq	15.3800306	Pr > W-Sq	<0.005
Anderson-Darling	A-Sq	87.3674353	Pr > A-Sq	<0.005

Quantiles for Normal Distribution
Percent	Quantile
	Observed	Estimated
1.0	61500.0	-5048.18
5.0	87500.0	49394.14
10.0	105250.0	78417.14
25.0	129500.0	126913.30
50.0	160000.0	180796.06
75.0	213500.0	234678.82
90.0	281356.5	283174.98
95.0	335000.0	312197.98
99.0	457347.0	366640.30
Years Sold
Below is the frequency of the number of houses sold each year. Highest percentage of houses were sold in 2007. And lost was in 2010. There is increase in one year and decrease in next year.
If the same patter follow, 2011 may have increase in sales of house 
This one is using the procedure FREQ
Code 
proc FREQ data=mydata.ames_housing_data;
tables YrSold;
run; quit;

Output
YrSold	Frequency	Percent	Cumulative
Frequency	Cumulative
Percent
2006	625	21.33	625	21.33
2007	694	23.69	1319	45.02
2008	622	21.23	1941	66.25
2009	648	22.12	2589	88.36
2010	341	11.64	2930	100.00

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
Neighborhood	N Obs	Minimum	Mean	Median	Maximum
Blmngtn	28	156820.00	196661.68	191500.00	264561.00
Blueste	10	115000.00	143590.00	130500.00	200000.00
BrDale	30	83000.00	105608.33	106000.00	125500.00
BrkSide	108	39300.00	124756.25	126750.00	223500.00
ClearCr	44	107500.00	208662.09	197500.00	328000.00
CollgCr	267	110000.00	201803.43	200000.00	475000.00
Crawfor	103	90350.00	207550.83	200624.00	392500.00
Edwards	194	35000.00	130843.38	125000.00	415000.00
Gilbert	165	115000.00	190646.58	183000.00	377500.00
Greens	8	155000.00	193531.25	198000.00	214000.00
GrnHill	2	230000.00	280000.00	280000.00	330000.00
IDOTRR	93	13100.00	103752.90	106500.00	212300.00
Landmrk	1	137000.00	137000.00	137000.00	137000.00
MeadowV	37	71000.00	95756.49	88250.00	151400.00
Mitchel	114	80000.00	162226.63	153500.00	300000.00
NAmes	443	68000.00	145097.35	140000.00	345000.00
NPkVill	23	120000.00	140710.87	143750.00	155000.00
NWAmes	131	82500.00	188406.91	181000.00	306000.00
NoRidge	71	190000.00	330319.13	302000.00	755000.00
NridgHt	166	154000.00	322018.27	317750.00	615000.00
OldTown	239	12789.00	123991.89	119900.00	475000.00
SWISU	48	60000.00	135071.94	136200.00	200000.00
Sawyer	151	62383.00	136751.15	135000.00	219000.00
SawyerW	125	67500.00	184070.18	180000.00	320000.00
Somerst	182	139000.00	229707.32	225500.00	468000.00
StoneBr	51	130000.00	324229.20	319000.00	591587.00
Timber	72	137500.00	246599.54	232106.50	425000.00
Veenker	24	150000.00	248314.58	250250.00	385000.00

Neighborhood: SGPLOT
We can generate a histogram to see the number of houses sold in each neighbourhood.
Code
proc sgplot data=mydata.ames_housing_data;
vbar Neighborhood / group=LotShape;
run;quit;
Output
 
MOSOLD: SGPLOT
To know the time period in year when most of the houses sold. It helps to find best month when the customers are willing to sold and when will there be a lot rate in sold. 
Code
proc sgplot data=mydata.ames_housing_data;
vbar MoSold/ group=LotShape groupdisplay=cluster;
run;quit;

Output
 

Neighborhood, Sale Price: Scatter Plot
We can see the scatter plot for Sales Price grouping by neighborhood. 
The procedure for this is SGPLOT and the parameter is SCATTER
Code
proc sgplot data=mydata.ames_housing_data;
scatter x=neighborhood y=SalePrice;
run; quit;

Output

 
Neighborhood, Boxplot
To find the outliers of the sale prices, we can run the box plot with a horizontal bars. 
The graph shows the outliers of prices for each neighborhood. 
The procedure used for this is SGPLOT with hbox parameter.
Code
proc sgplot data=mydata.ames_housing_data;
hbox SalePrice / category=neighborhood transparency=0.75; *Try 0.75 and 0.25;
run; quit;

Output
 
Give Live Area, Sale Price: Regression and LOESS
We can get a view of regression and LOESS by using the procedure SGPLOT with the reg and loess parameters
Code
proc sgplot data=mydata.ames_housing_data;
reg x=GrLivArea y=SalePrice / clm;
loess x=GrLivArea y=SalePrice / nomarkers;
run; quit;

Output
 
