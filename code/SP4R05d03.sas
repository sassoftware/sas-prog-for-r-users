/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05d03*/

/*Part A*/
ods select basicmeasures;
ods output basicmeasures = sp4r.SalePrice_BasicMeasures;
proc univariate data=sp4r.ameshousing;
   var saleprice;
run;

proc print data=sp4r.saleprice_basicmeasures;
run;

/*Part B*/
proc univariate data=sp4r.ameshousing;
   var saleprice;
   output out=sp4r.stats mean=saleprice_mean pctlpts= 40, 45, 50, 55, 60 
      pctlpre=saleprice_;
run;

proc print data=sp4r.stats;
run;

/*Part C*/
proc means data=sp4r.ameshousing;
   var saleprice garage_area;
   output out=sp4r.stats mean(saleprice)=sp_mean median(garage_area)=ga_med;
run;

proc print data=sp4r.stats;
run;

/*Part D*/
proc means data=sp4r.ameshousing;
   var saleprice garage_area;
   output out=sp4r.stats mean= std= / autoname;
run;

proc print data=sp4r.stats;
run;
