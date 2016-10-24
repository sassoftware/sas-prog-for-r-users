/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R03s04*/

/*Part A*/
proc sql;
   create table make as select unique make from sp4r.cars;
   create table type as select unique type from sp4r.cars;
   create table origin as select unique origin from sp4r.cars;
quit;

/*Part B*/
data sp4r.mylist;
   merge make type origin;
run;

/*Part C*/
proc print data= sp4r.mylist;
run;
