/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d07*/

/*Part A*/
proc logistic data=sp4r.ameshousing plots(only)=(effect oddsratio roc);
   class fireplaces(ref='0') lot_shape_2(ref='Regular') / param=ref;
   model bonus(event='1') = basement_area fireplaces lot_shape_2 
      / clodds=wald;
   units basement_area = 100;
   estimate 'my estimate' intercept 1 basement_area 1000 
      fireplaces 1 0 lot_shape_2 1 / e alpha=.05 ilink;
   output out=sp4r.out p=pred;
   store mymod;
run; 

proc print data=sp4r.out (obs=5);
   var bonus basement_area fireplaces lot_shape_2 pred;
run;

/*Part B*/
proc plm restore=mymod;
   score data=sp4r.newdata_ames_logistic out=sp4r.pred_newdata 
      predicted lclm uclm /ilink;
run;

/*Part C*/
proc print data=sp4r.pred_newdata;
   var bonus basement_area fireplaces lot_shape_2 predicted lclm uclm;
run;
