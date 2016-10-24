/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R03s05*/

/*Part A*/
data sp4r.sports(keep= make type msrp);
   set sp4r.cars;
   where type='Sports' and msrp>100000;
run;

/*Part B*/
data sp4r.suv(keep= make type msrp);
   set sp4r.cars;
   where type='SUV' and msrp>60000;
run;

/*Part C*/
data sp4r.expensive;
   set sp4r.sports sp4r.suv;
run;

proc print data= sp4r.expensive;
run;
