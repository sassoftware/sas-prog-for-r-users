/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R03s03*/

/*Part A*/
proc fcmp outlib=work.functions.newfuncs;
   function tier(val) $; 
      length newval $ 6;
      if val < 20 then newval = 'Low';
      else if val <30 then newval='Medium';
	  else newval='High';
      return(newval);
   endsub;
quit;

/*Part B*/
options cmplib=work.functions;
data sp4r.cars;
   set sp4r.cars;
   mpg_quality2=tier(mpg_average);
run;

/*Part C*/
proc print data=sp4r.cars (firstobs=65 obs=70);
   var mpg_average mpg_quality mpg_quality2;
run;
