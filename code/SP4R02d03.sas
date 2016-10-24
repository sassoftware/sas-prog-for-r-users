/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02d03*/

data employees;
   input name $ bday :mmddyy8. @@;
   datalines;
   Jill 01011960 Jack 05111988 Joe 08221975
   ;
run;

proc print data=employees;
run;

data employees;
   input name $ bday :mmddyy8. @@;
   format bday mmddyy10.;
   label name="First Name" bday="Birthday";
   datalines;
   Jill 01011960 Jack 05111988 Joe 08221975
   ;
run;

proc print data=employees label;
run;
