/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05s05*/

/*Part A*/
%macro myimport(firstyear,lastyear);
   %do i=&firstyear %to &lastyear;
      proc import datafile = "&path\amesbyyear.xlsx" 
         out = sp4r.year&i
         dbms = xlsx REPLACE; 
         getnames = yes;
         sheet = "&i";
         datarow = 2;
      run;
   %end;
%mend;

/*Part B*/
options mprint;
%myimport(2006,2010)
