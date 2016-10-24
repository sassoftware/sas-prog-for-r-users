/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05s04*/

/*Part A*/
%macro mystats(dt,freq=no,corr=no,means=no,opts=,scatter=no);

%if &dt= %then %do;
   %put dt is a required argument;
   %return;
%end;

/*Part B*/
proc contents data=&dt varnum out=dtcontents;
run;

proc sql;
   select distinct name into: vars_cont separated by ' ' 
      from dtcontents where type=1;
   select distinct NAME into: vars_cat  separated by ' ' 
      from dtcontents where type=2;
quit;

/*Part C*/
%if %upcase(&freq)=YES %then %do;
   proc freq data=&dt;
      tables &vars_cat;
   run; 
%end;

/*Part D*/
%if %upcase(&means)=YES %then %do;
   proc means data=&dt &opts;
      var &vars_cont;
   run;
%end;

/*Part E*/
%if %upcase(&scatter)=YES %then %do;
   proc sgscatter data=&dt;
      matrix &vars_cont;
   run;
%end;
%mend;

/*Part F*/
%mystats(sp4r.cars,freq=yes)

/*Part G*/
%mystats(sp4r.cars,means=yes,opts=mean median maxdec=2,scatter=yes)
