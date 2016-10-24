/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02s05*/

/*Part A*/
proc format;
   value gradesformat 0-59='F' 60-69='D' 70-79='C' 80-89='B' 90-100='A';
run;

/*Part B*/
data sp4r.class;
   input student $ country $ grade bd @@;
   label bd='Birthday';
   format grade gradesformat. bd worddate.;
   datalines;
   John Spain 95 12000 Mary Spain 82 12121 Alison France 98 12026 
   Nadine Spain 77 12222 Josh Italy 61 12095 James France 45 12301 
   William France 92 12284 Susan Italy 95 12079 
   Charlie France 88 12234 Alice Italy 89 12014 Robert Italy 92 12025 
   Emily Spain 87 12148 Arthur Italy 99 12052 Nancy France 70 12238 
   Kristin France 65 12084 Sara Italy 49 12322 Ashley Spain 96 12299 
   Aaron France 95 12052 Sean France 87 12254 Phil Italy 86 12036
   ;
run;

/*Part C*/
proc print data= sp4r.class label;
run;

/*Part D*/
proc sql;
   select unique country from sp4r.class;
quit;

/*Part E*/
proc print data= sp4r.class;
   var student country grade;
   where grade>79 and country='France';
run;

