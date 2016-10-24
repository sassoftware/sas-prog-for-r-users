/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04s04*/

/*Part A*/
data sp4r.simple_lin (keep=x y);
   call streaminit(123);
   do x=1 to 30;
      beta01 = 25;
      beta11 = 1;
      y = beta01 + beta11*x + rand('Normal',0,5);
      output;
   end;
run;

/*Part B*/
proc sgplot data=sp4r.simple_lin;
   scatter x=x y=y / legendlabel='Scatter' name='Scatter' 
      markerattrs=(color=blue symbol=starfilled);
   reg x=x y=y / legendlabel='Line of Best Fit' name='Line'
      lineattrs=(color=red pattern=dot);

   title 'My Scatter Plot';
   xaxis label='X Values' min=0 max=31;
   yaxis label='Y Values' min=15 max=65;
   keylegend 'Scatter' 'Line';
run;
title;

/*Part C*/
proc sgplot data=sp4r.simple_lin;
   needle x=x y=y / legendlabel='Needle' name='Needle' markerattrs=(color=blue symbol=starfilled);
   pbspline x=x y=y / legendlabel='Line of Best Fit' name='Line'
      lineattrs=(color=red pattern=dot);

   title 'My Needle Plot';
   xaxis label='X Values' min=0 max=31;
   yaxis label='Y Values' min=15 max=65;
   keylegend 'Needle' 'Line';
run;
title;
