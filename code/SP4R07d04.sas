/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d04*/

/*Part A*/
proc iml;
   use sp4r.cars;
   read all var {msrp mpg_city mpg_highway} where(msrp>80000) into imlCars;
   close sp4r.cars;

   varNames = {"MSRP" "MPG City" "MPG Highway"};
   Means = mean(imlCars);
   print imlCars, Means[colname=varNames];
quit;

/*Part B*/
proc iml;
   call randseed(802);
   n=10;
   weight = randfun(n,"Normal",200,50);
   age = randfun(n, "Poisson",35);

   create sp4r.newDataTable var{age weight};
   append;
   close sp4r.newDataTable;

   /*Identical Result 2
   create sp4r.newDataTable2;
   append var{age weight};
   close sp4r.newDataTable2;*/

   /*Identical Result 3
   mymat = age||weight;
   print mymat;

   create newDataTable from mymat [colname={weight, age}];
   append from mymat;
   close newDataTable;*/
quit;

proc print data=sp4r.newDataTable; run;

/*Part C*/
proc iml;
   call randseed(919);
   n=10;
   weight = randfun(n,"Normal",200,50);
   age = randfun(n, "Poisson",35);
   mymat = age||weight;

   edit sp4r.newDataTable;
   append from mymat;
   close sp4r.newDataTable;
quit;

proc print data=sp4r.newDataTable; run;
