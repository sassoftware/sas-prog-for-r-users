/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R03s02*/

/*Part A*/
data sp4r.cars;
   length mpg_quality $ 6;
   set sp4r.cars;
   if mpg_average < 20 then mpg_quality='Low';
   else if mpg_average < 30 then mpg_quality='Medium';
   else mpg_quality='High';
run;

/*Part B*/
proc print data=sp4r.cars (firstobs=65 obs=70);
   var mpg_average mpg_quality;
run;
