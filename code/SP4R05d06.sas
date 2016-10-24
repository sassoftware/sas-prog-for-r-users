/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05d06*/

%macro myappend(start,stop);
   %do year=&start %to &stop;
      proc import datafile="&path\sales_&year..csv" out=sp4r.sales_&year dbms=csv replace;
      run;

      proc append base=sp4r.sales_all data=sp4r.sales_&year;
      run;

      proc datasets library=sp4r noprint;
         delete sales_&year;
      quit;
   %end;
%mend;

options mprint;
%myappend(2000,2009)

/*Why did we use a double period to specify the DATAFILE above?*/
%let mypath = s:workshop\;
%put &mypathmydata.csv;
%put &mypath.mydata.csv;

%let mydata = sales_data;
%put &mydata.csv;
%put &mydata..csv;
