/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s05*/

/*Part A*/
proc freq data=sp4r.cars;
   tables type origin drivetrain;
run;

/*Part B*/
proc glmselect data=sp4r.cars outdesign=sp4r.des;
   class type origin drivetrain;
   model mpg_highway = type|origin|drivetrain / selection=forward 
      select=sl sle=.05 hierarchy=single;
run;quit;


