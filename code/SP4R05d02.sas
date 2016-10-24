/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05d02*/

/*Part A*/
ods trace on;
proc univariate data=sp4r.ameshousing;
   var saleprice;
   qqplot saleprice / normal(mu=est sigma=est);
run;
ods trace off;

/*Part B*/
ods select basicmeasures qqplot;
proc univariate data=sp4r.ameshousing;
   var saleprice;
   qqplot saleprice / normal(mu=est sigma=est);
run;
