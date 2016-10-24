/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d02*/

/*Part A*/
proc print data=sp4r.paper;
run;

/*Part B*/
proc sgplot data=sp4r.paper;
   reg  x=amount y=strength / legendlabel="Linear";
   reg  x=amount y=strength / degree=2 legendlabel="Quadratic";
   reg  x=amount y=strength / degree=3 legendlabel="Cubic";
   title 'Polynomial Plot';
run;
title;

/*Part C*/
data sp4r.paper;
   set sp4r.paper;
   amount_sq = amount*amount;
   amount_cub = amount*amount*amount;
run;

proc reg data=sp4r.paper;
   model strength = amount amount_sq amount_cub;
run;quit;




