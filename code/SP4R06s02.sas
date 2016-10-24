/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s02*/

/*Part A*/
proc reg data=sp4r.bodyfat;
   model weight = height neck chest;
   store mymod;
run;quit;

/*Part B*/
proc plm restore=mymod;
   score data=sp4r.newdata_bodyfat_reg out=sp4r.pred_newdata_bodyfat predicted;
run;

/*Part C*/
proc print data=sp4r.pred_newdata_bodyfat;
   var weight height neck chest predicted;
run;
