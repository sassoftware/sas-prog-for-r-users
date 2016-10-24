/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s01*/

/*Part A*/
proc corr data=sp4r.bodyfat;
   var height neck chest weight;
run;

/*Part B*/
ods select basicmeasures;
proc univariate data=sp4r.bodyfat;
   var height neck chest weight;
run;

/*Part C*/
proc sgscatter data=sp4r.bodyfat;
   plot weight * (height neck chest) / reg;
run;

/*Part D*/
ods select anova fitstatistics parameterestimates;
proc reg data=sp4r.bodyfat;
   model weight = height neck chest;
   output out=sp4r.out predicted=pred residual=res;
run;quit;

/*Part E*/
ods select histogram qqplot;
proc univariate data=sp4r.out;
   var res;
   histogram res / normal kernel;
   qqplot res / normal(mu=est sigma=est);
run;


