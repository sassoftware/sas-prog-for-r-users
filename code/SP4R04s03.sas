/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04s03*/

/*Part A*/
data sp4r.hist;
   call streaminit(123);
   do i=1 to 1000;
      rchisq = rand('chisquare',20);
      output;
   end;
run;

/*Part B*/
proc sgplot data=sp4r.hist;
   histogram rchisq / binwidth=1 scale=count;
   density rchisq / type=normal;
   density rchisq / type=kernel;
   title 'My Random Chi-Square Distribution';
   xaxis label='Random Chi-Square Deviates' min=5 max=40;
run;
title;
