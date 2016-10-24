/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06s09*/

/*Part A*/
proc freq data=sp4r.earinfection;
   tables swimmer location age gender infections;
run;

/*Part B*/
ods select basicmeasures histogram;
proc univariate data=sp4r.earinfection;
   var infections;
   histogram infections / normal;
run;

/*Part C*/
proc genmod data=sp4r.earinfection;
   class swimmer(ref='Occas') location(ref='NonBeach') 
      gender(ref='Female') / param=ref;
   model infections = swimmer location age gender / 
      dist=poisson type3;
   store mymod;
run;

/*Part D*/
data sp4r.newdata_inf;
   input Swimmer $ Location $ Age Gender $;
   datalines;
Freq NonBeach 25 Female
Occas Beach 15 Male
;run;

/*Part E*/
proc plm restore=mymod;
   score data=sp4r.newdata_inf out=sp4r.scores / ilink;
run;

proc print data=sp4r.scores;
run;
