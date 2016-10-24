/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d01*/

/*Part A*/
proc sgscatter data=sp4r.ameshousing;
   plot saleprice * (gr_liv_area age_sold) / reg;
run;

/*Part B*/
ods select anova fitstatistics parameterestimates residualplot;
proc reg data=sp4r.ameshousing;
   model saleprice = gr_liv_area age_sold;
   output out=sp4r.out predicted=pred residual=res rstudent=rstudent;
run;quit;

/*Part C*/
proc sgplot data=sp4r.out;
   scatter x=pred y=res;
   refline 0 / axis=y;
run;

/*Part D*/
ods select basicmeasures histogram qqplot;
proc univariate data=sp4r.out;
   var res;
   histogram res / normal kernel;
   qqplot res / normal(mu=est sigma=est);
run;

/*Part E*/
proc reg data=sp4r.ameshousing;
   model saleprice = gr_liv_area age_sold;
   store mymod;
run;quit;

proc plm restore=mymod;
   score data=sp4r.newdata_ames_reg out=sp4r.pred_newdata predicted;
run;

/*Part F*/
proc print data=sp4r.pred_newdata;
   var saleprice gr_liv_area age_sold predicted;
run;
