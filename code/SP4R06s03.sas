/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s03*/

/*Part A*/
proc freq data=sp4r.cars;
   table type;
run;

/*Part B*/
ods select moments histogram;
proc univariate data=sp4r.cars;
   var mpg_highway;
   histogram mpg_highway / normal;
run;

/*Part C*/
proc glm data=sp4r.cars plots(only)=boxplot;
   class type (ref='Hybrid');
   model mpg_highway = type / solution clparm;
   lsmeans type / adjust=tukey pdiff cl;
   estimate 'SUV vs Truck' type 1 0 0 -1 0 0;
run;quit;

