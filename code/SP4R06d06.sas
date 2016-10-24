/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d06*/

/*Part A*/
proc glmselect data=sp4r.paper outdesign=sp4r.des;
   effect amount_pol = polynomial(amount / degree=5);
   model strength = amount_pol / selection=forward select=sl sle=.05 
      hierarchy=single;
run;quit;

/*Part B*/
proc print data=sp4r.des;
run;

proc reg data=sp4r.des;
   model strength = &_glsmod;
run;quit;



