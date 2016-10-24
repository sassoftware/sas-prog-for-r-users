/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d05*/

/*Part A*/
%let cont_vars = lot_area gr_liv_area garage_area basement_area deck_porch_area age_sold;
%let cat_vars = heating_qc central_air fireplaces lot_shape_2;

proc glmselect data=sp4r.ameshousing2 plots=all seed=802;
   class &cat_vars;
   model saleprice = &cont_vars &cat_vars / selection=lasso(choose=validate stop=none);
   partition fraction(validate=0.5);
   store mymod;
run;

/*Part B*/
proc plm restore=mymod;
   score data=sp4r.newdata_ames_reg out=sp4r.pred_newdata 
      predicted;
run;

/*Part C*/
proc print data=sp4r.pred_newdata;
   var saleprice predicted;
run;

