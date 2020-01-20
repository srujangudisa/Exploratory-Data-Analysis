

* Predict 410 data warehouse;
libname mydata	'C:\Srujan\College\410' access=readonly;

* List out the column names and data types for the data set;
proc contents data=mydata.ames_housing_data; run; quit;

* Print out the first 10 observations on the data set;
proc print data=mydata.ames_housing_data(obs=10); run; quit;


********************************************************************;
* Basic data summaries;
********************************************************************;
* How do we perform basic data summaries in SAS?;
* What are basic data summaries for categorical data?;
* What are basic data summaries for numeric data?;
* All of these basic summaries are covered in The Little SAS Book;



********************************************************************;
* Frequency Tables for Categorical Data;
********************************************************************;
* One-Way Frequency Table;
proc freq data=mydata.ames_housing_data;
tables LotShape;
run;quit;

* Two-Way Frequency Table;
proc freq data=mydata.ames_housing_data;
tables LotShape*Neighborhood;
run;quit;




********************************************************************;
* Summary Statistics for Numeric Data;
********************************************************************;
* Two 'procedures' available in SAS - PROC UNIVARIATE and PROC MEANS;
* Each of these PROCs have a variety of options for computing
* summary statistics.  See The Little SAS Book for these options.;

proc univariate data=mydata.ames_housing_data;
var SalePrice;
*histogram SalePrice / Normal;
run; quit;


proc means data=mydata.ames_housing_data mean;
var SalePrice;
run; quit;


proc means data=mydata.ames_housing_data min mean median max;
var SalePrice;
run; quit;



********************************************************************;
* Conditional Summary Statistics for Numeric Data 
*	- Use the CLASS statement;
********************************************************************;

proc univariate data=mydata.ames_housing_data;
class neighborhood;
var SalePrice;
run; quit;


proc means data=mydata.ames_housing_data min mean median max;
class neighborhood;
var SalePrice;
run; quit;


********************************************************************;
* Begining with SAS 9.2 SAS has been embedding some ODS graphics
* into its statistical procedures.
* However, it is recommended that you use PROC SGPLOT for statistical
* graphics, and not the graphics from these procedures.
********************************************************************;

proc univariate data=mydata.ames_housing_data;
var SalePrice;
histogram SalePrice / normal;
run; quit;

proc print data=mydata.ames_housing_data;
histogram YrSold;
run; quit;

**SalePrice < 0;

proc print data=mydata.ames_housing_data;
where TotalBsmtSF =0;
run; quit;

proc print data=mydata.ames_housing_data;
where SalePrice < 50000;
run; quit;

proc print data=mydata.ames_housing_data;
where GarageArea =0;
run; quit;

proc print data=mydata.ames_housing_data;
where YrSold< 2006;
run; quit;

proc print data=mydata.ames_housing_data;
where GrLivArea < 600;
run; quit;

proc print data=mydata.ames_housing_data;
where GrLivArea < 600;
run; quit;

proc sort data=mydata.ames_housing_data;
 by SalePrice descending;
run; quit;

proc univariate data=mydata.ames_housing_data;
var SalePrice;
histogram SalePrice / Normal;
run; quit;


proc FREQ data=mydata.ames_housing_data;
tables YrSold;
run; quit;


/* FINAL NOTE:
In the RESULTS tab click on the Word icon to download SAS output in
RTF format.  This will allow you to cut and paste the output into
your report.
*/




