/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02s04*/

proc import out = sp4r.state_pop2
   datafile = "&path\state_pop.xlsx" 
   dbms = xlsx REPLACE; 
   getnames = NO;
   sheet = "State_Pop_Data";
   datarow = 1;
run;

data sp4r.state_pop2;
   set sp4r.state_pop2;
   rename A = State B = Population;
run;
