/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04d02*/

/*Part A*/
data sp4r.hist_data;
   call streaminit(123);
   do i=1 to 1000;
      x = rand('exponential')*10;
      output;
   end;
run;

proc sgplot data=sp4r.hist_data;
   histogram x;
run;

proc sgplot data=sp4r.hist_data;
   histogram x / binwidth=1;
   density x / type=normal;
   density x / type=kernel;
run;

/*Part B*/
data sp4r.boxplot_data (drop=rep);
   call streaminit(123);
   do group=1 to 3;
      do rep=1 to 100;
         response = rand('exponential')*10;
         output;
      end;
   end;
run;

proc sgplot data=sp4r.boxplot_data;
   hbox response;
run;

proc sgplot data=sp4r.boxplot_data;
   hbox response / category=group;
run;

/*Part C*/
data sp4r.sales;
   call streaminit(123);
   do month=1 to 12;
      revenue = rand('Normal',10000,5000);
      output;
   end;
run;

proc sgplot data=sp4r.sales;
   vbar month / response=revenue;
run;

/*Part D*/
data sp4r.series_data (keep=x y1 y2);
   call streaminit(123);
   do x=1 to 30;
      beta01 = 10;
      beta11 = 1;
      y1 = beta01 + beta11*x + rand('Normal',0,5);
      beta02 = 35;
      beta12 = .5;
      y2 = beta02 + beta12*x + rand('Normal',0,5);
      output;
   end;
run;

proc sgplot data=sp4r.series_data;
   scatter x=x y=y1;
   scatter x=x y=y2;
run;

proc sgplot data=sp4r.series_data;
   series x=x y=y1;
   series x=x y=y2;
run;

proc sgplot data=sp4r.series_data;
   series x=x y=y1;
   scatter x=x y=y1;
   series x=x y=y2;
   scatter x=x y=y2;
run;

/*Part E*/
proc sgplot data=sp4r.series_data;
   reg x=x y=y1 / clm cli;
   reg x=x y=y2 / clm cli;
run;
