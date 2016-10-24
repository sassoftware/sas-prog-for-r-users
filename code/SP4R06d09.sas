/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d09*/

/*Part A*/
proc sgplot data=sp4r.grass;
   vline variety / group=method stat=mean response=yield;
run;

/*Part B*/
proc mixed data=sp4r.grass method=REML;
   class method variety;
   model yield = method / solution ddfm=kr2;
   random variety method*variety;
   lsmeans method / pdiff;
   estimate 'A vs. B and C' method 1 -.5 -.5;
run;

/*Part C*/
ods select type3;
proc mixed data=sp4r.grass method=type3;
   class method variety;
   model yield = method / solution ddfm=kr2;
   random variety method*variety;
   lsmeans method / pdiff;
   estimate 'A vs. B and C' method 1 -.5 -.5;
run;
