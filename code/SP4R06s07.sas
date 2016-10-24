/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s07*/

/*Part A*/
proc print data=sp4r.cafeteria;
run;

/*Part B*/
proc sgplot data=sp4r.cafeteria;
   scatter  x=dispensers y=sales;
run;

/*Part C*/
proc glmselect data=sp4r.cafeteria outdesign=sp4r.des plots=all;
   effect cafe_pol = polynomial(dispensers / degree=3);
   model sales = cafe_pol / selection=forward select=sl sle=.05 
      hierarchy=single;
run;quit;

/*Part D*/
proc sgplot data=sp4r.cafeteria;
   reg  x=dispensers y=sales / degree=2 legendlabel="Quadratic";
run;

/*Part E*/
proc reg data=sp4r.des;
   model sales = &_glsmod;
run;quit;
