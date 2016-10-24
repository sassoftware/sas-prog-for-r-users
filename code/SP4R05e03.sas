/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05e03*/

data _NULL_;
   x=-3;
   df=5;
   p=(1-probt(abs(x),df))*2;
   call symputx('sig_level',p);
run;

%put The significance level for the two-tailed t test is &sig_level;
