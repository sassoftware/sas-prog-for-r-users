/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d08*/

/*Part A*/
proc sgplot data=sp4r.crab;
   histogram satellites;
   density satellites / type=kernel;
run;

proc means data=sp4r.crab;
   var satellites width weight;
run;

proc freq data=sp4r.crab;
   tables satellites color spine;
run;

/*Part B*/
proc genmod data=sp4r.crab plots=resraw;
   class color(param=ref ref='1') spine(param=ref ref='1');
   model satellites = width weight color spine 
      / dist=poi link=log type3;
   estimate 'my estimate' intercept 1 width 25 weight 2.5 
      color 1 0 0  spine 1 0 / e exp alpha=.05;
   output out=sp4r.out p=pred resraw=res;
run;

proc sgplot data=sp4r.out;
   scatter y=res x=pred;
run;

/*Part C*/
proc genmod data=sp4r.crab plots=resraw;
   class color(param=ref ref='1') spine(param=ref ref='1');
   model satellites = width weight color spine 
      / dist=negbin link=log type3;
   estimate 'my estimate' intercept 1 width 25 weight 2.5 
      color 1 0 0  spine 1 0 / e exp alpha=.05;
   output out=sp4r.out p=pred resraw=res;
   store mymod;
run;

/*Part D*/
data sp4r.newcrab;
   input Color Spine Width Satellites Weight;
   datalines;
2 2 25 0 2.5
;run;

proc plm restore=mymod;
   score data=sp4r.newcrab out=sp4r.scores / ilink;
run;

proc print data=sp4r.scores;
run;
