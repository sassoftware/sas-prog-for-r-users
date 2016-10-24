/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05s03*/

/*Part A*/
data _NULL_;
   x=-3;
   df=5;
   p=(1-probt(abs(x),df))*2;
   call symputx('sig_level',p);
run;

%put The significance level for the two-tailed t test is &sig_level;

/*Part B*/
proc means data=sp4r.ameshousing;
   var saleprice;
   output out=stats median=sp_med;
run;

data _null_;
   set stats;
   call symputx('med',sp_med);
run;

%put The median of the Sale Price variable is &med;

/*Part A*/
