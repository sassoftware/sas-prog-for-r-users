/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02d01*/

/*Part A*/
data sp4r.example_data;
   length First_Name $ 25 Last_Name $ 25;
   input First_Name $ Last_Name $ age height;
   datalines;
   Jordan Bakerman 27 68
   Bruce Wayne 35 70
   Walter White 51 70
   Henry Hill 65 66
   JeanClaude VanDamme 55 69
;
run;

/*Part B*/
data sp4r.example_data2;
   length First_Name $ 25 Last_Name $ 25;
   input First_Name $ Last_Name $ age height @@;
   datalines;
   Jordan Bakerman 27 68 Bruce Wayne 35 70 Walter White 51 70
   Henry Hill 65 66 JeanClaude VanDamme 55 69
   ;
run;
