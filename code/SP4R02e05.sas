/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02e05*/

data sp4r.class;
   input student $ country $ grade bd @@;
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

