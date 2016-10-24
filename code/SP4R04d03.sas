/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04d03*/

/*Part A*/
data sp4r.sales;
   call streaminit(123);
   do month=1 to 12;
      revenue = rand('Normal',10000,1000);
      revenue_2 = rand('Normal',13000,500);
      output;
   end;
run;

/*Part B*/
proc sgplot data=sp4r.sales;
   series x=month y=revenue / legendlabel='Company A'
      lineattrs=(color=blue pattern=dash);
   series x=month y=revenue_2 / legendlabel='Company B'
      lineattrs=(color=red pattern=dash);

   title 'Monthly Sales of Company A and B for 2015';
   xaxis label="Month" values=(1 to 12 by 1);
   yaxis label="Revenue for 2015";
   inset "Jordan Bakerman" / position=bottomright;
   refline 6.5 / transparency= 0.5 axis=x;
   refline 11000 / transparency= 0.5;
run;
title;

/*Part C*/
proc sgplot data=sp4r.sales;
   series x=month y=revenue / legendlabel='Company A' name='Company A'
      lineattrs=(color=blue pattern=dash);
   scatter x=month y=revenue / markerattrs=(color=blue
      symbol=circlefilled);
   series x=month y=revenue_2 / legendlabel='Company B' 
      name='Company B' lineattrs=(color=red pattern=dash);
   scatter x=month y=revenue_2 / markerattrs=(color=red 
      symbol=circlefilled);

   title 'Monthly Sales of Company A and B for 2015';
   xaxis label="Month" values=(1 to 12 by 1);
   yaxis label="Revenue for 2015" min=8000 max=14000;
   inset "Jordan Bakerman" / position=bottomright;
   refline 11000 / transparency= 0.5;
   refline 6.5 / transparency= 0.5 axis=x;
   keylegend 'Company A' 'Company B';
run;
title;
