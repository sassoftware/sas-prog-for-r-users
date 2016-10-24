/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s08*/

/*Part A*/
proc freq data=sp4r.safety; 
run;

/*Part B*/
proc logistic data=sp4r.safety plots(only)=effect;
   class region(ref='Asia') size(ref='3') / param=ref;
   model unsafe(event='1') = weight region size / clodds=wald;
   estimate 'My Estimate' intercept 1 weight 4 region 1 size 1 0 / 
      e alpha=.05 ilink;
run;

/*Part C*/
ods select modelbuildingsummary modelanova parameterestimates;
proc logistic data=sp4r.safety;
   class region(ref='Asia') size(ref='3') / param=ref;
   model unsafe(event='1') = weight region size / 
      selection=backward sls=.05 clodds=wald;
run;

