/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04s06*/

/*Part A*/
data sp4r.random;
   call streaminit(123);
   do i=1 to 300;
      x = rand('Normal');
      y1 = x + rand('Normal');
      y2 = 5*x + rand('Normal');
      output;
   end;
run;

/*Part B*/
proc sgscatter data=sp4r.random;
   matrix x y1 y2 / diagonal=(histogram kernel);
   title 'Scatter Plot Matrix';
run;
title;

/*Part C*/
proc sgscatter data=sp4r.random;
   plot (y1 y2) * x / reg;
   title 'Scatter Plots';
run;
title;

/*Part D*/
proc sgscatter;
   compare y=(y1 y2) x=x / reg;
   title 'Scatter Plots';
run;
title;
