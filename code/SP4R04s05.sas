/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04s05*/

/*Part A*/
data sp4r.bubble;
   call streaminit(123);
   do group=1 to 2;
      do x=1 to 20;
         y = rand('Exponential');
         z = rand('binomial',.5,5);
         output;
      end;
   end;
run;

/*Part B*/
proc sgplot data=sp4r.bubble;
   bubble x=x y=y size=z / group=group;

   title 'My Bubble Plot';
   xaxis label='X Values';
   yaxis label='Y Values';
run;
