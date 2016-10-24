/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s04*/

/*Part A*/
proc sql;
   select mean(horsepower) into :hp_mean from sp4r.cars;
quit;

/*Part B*/
proc glm data=sp4r.cars  plots(only)=ancovaplot;
   class type (ref='Hybrid');
   model mpg_highway = type|horsepower / solution clparm;
   lsmeans type / at horsepower=&hp_mean adjust=tukey pdiff cl;
   estimate 'SUV vs Truck' type 1 0 0 -1 0 0 type*horsepower 
      &hp_mean 0 0 -&hp_mean 0 0;
run;quit;




