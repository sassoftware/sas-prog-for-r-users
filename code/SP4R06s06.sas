/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s06*/

/*Part A*/
proc corr data=sp4r.cars;
   var mpg_highway horsepower enginesize weight wheelbase length;
run;

/*Part B*/
proc glmselect data=sp4r.cars outdesign=sp4r.des;
   model mpg_highway = horsepower enginesize weight wheelbase length / 
      selection=stepwise select=AICC;
   store mymod;
run;quit;

/*Part C*/
proc plm restore=mymod;
   score data=sp4r.newdata_cars out=sp4r.pred_newdata_cars 
      predicted uclm lclm lcl ucl;
run;

/*Part D*/
proc print data=sp4r.pred_newdata_cars;
   var mpg_highway &_glsmod predicted uclm lclm lcl ucl;
run;
