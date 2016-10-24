/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R03s01*/

/*Part A*/
data sp4r.cars;
   set sp4r.cars;
   mpg_average = mean(mpg_city,mpg_highway);
run;

/*Part B*/
proc print data=sp4r.cars (obs=5);
   var mpg_city mpg_highway mpg_average;
run;
