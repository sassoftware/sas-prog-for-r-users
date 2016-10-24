/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05d04*/

/*Part A*/
proc means data=sp4r.ameshousing;
   var saleprice;
   output out=sp4r.stats mean=sp_mean std=sp_sd;
run;

proc sql;
   select sp_mean into :sp_mean from sp4r.stats;
   select sp_sd into :sp_sd from sp4r.stats;
quit;

/*Part B*/
data sp4r.ameshousing;
   set sp4r.ameshousing;
   sp_stan = (saleprice - &sp_mean) / &sp_sd;
run;

proc print data=sp4r.ameshousing (obs=6);
   var saleprice sp_stan;
run;

proc means data=sp4r.ameshousing mean std;
   var saleprice sp_stan;
run;

/*Part C*/
proc contents data=sp4r.cars varnum out=carscontents;
run;

proc print data=carscontents;
   var name type;
run;

/*Part D*/
proc sql;
   select distinct name into: vars_cont separated by ' ' from carscontents where type=1;
   select distinct name into: vars_cat  separated by ' ' from carscontents where type=2;
quit;

%put The continuous variables are &vars_cont and the categorical variables are &vars_cat;
