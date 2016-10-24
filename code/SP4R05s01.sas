/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05s01*/

/*Part A*/
proc freq data=sp4r.ameshousing;
   tables central_air house_style / plots=freqplot;
run;

/*Part B*/
ods select pearsoncorr;
proc corr data=sp4r.ameshousing;
   var saleprice garage_area basement_area gr_liv_area;
run;

/*Part C*/
ods output summary=summary_table;
proc means data=sp4r.ameshousing p10 median p90;
   var saleprice gr_liv_area;
   class yr_sold;
run;

proc print data=summary_table;
run;

/*Part D*/
proc univariate data=sp4r.ameshousing;
   var gr_liv_area;
   histogram gr_liv_area / normal kernel;
   qqplot gr_liv_area / normal(mu=est sigma=est);
   output out=gr_percs pctlpts= 40 to 60 by 2 pctlpre=gr_;
run;

proc print data=gr_percs;
run;
