/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02d02*/

/*Import data using a DATA step*/
data sp4r.all_names;
   length First_Name $ 25 Last_Name $ 25;
   infile "&path\allnames.csv" dlm=',';
   input First_Name $ Last_Name $ age height;
run;

/***************************************************************************************************/
/*Import data using PROC IMPORT*/
proc import out=sp4r.baseball 
   datafile= "&path\baseball.csv" DBMS=CSV REPLACE;
   getnames=yes;
   datarow=2; 
run;

/*Rename the variables*/
data sp4r.baseball;
   set sp4r.baseball;
   rename nAtBat = At_Bats
	     nHits = Hits
	     nHome = Home_Runs
	     nRuns = Runs
	     nRBI = RBIs
	     nError = Errors;
run;

/***************************************************************************************************/
/*Creating a SAS data set from delimited data by hand*/
data sp4r.example_data3;
   length First_name $ 25;
   infile datalines dlm='*';
   input First_Name $ Last_Name $ age height;
   datalines;
   Jordan*Bakerman*27*68
   Bruce*Wayne*35*70
   Walter*White*51*70
   Henry*Hill*65*66
   Jean Claude*Van Damme*55*69
;run;
