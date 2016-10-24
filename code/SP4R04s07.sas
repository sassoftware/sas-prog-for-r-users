/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04s07*/

/*Part A*/
data sp4r.random;
   call streaminit(123);
   do year=1 to 2;
      do j=1 to 300;
         x = rand('Normal');
         if year=1 then y = x + rand('Normal');
         if year=2 then y = 5*x + rand('Normal');
         output;
      end;
   end;
run;

/*Part B*/
proc sgpanel data=sp4r.random;
   panelby year;
   reg x=x y=y;
   title 'Regression Panels';
run;
title;
