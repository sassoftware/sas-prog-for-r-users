/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s07*/

/*Part A*/
proc iml;
   start mySample(n,min,max);
      x = randfun(n,"Uniform",min,max);
      return(x);
   finish;

/*Part B*/
   n = 30;
   min = 5;
   max = 10;
   call randseed(802);
   reps = 1000;
   vec = j(reps,1,.);

/*Part C*/
   do i=1 to reps;
	  vec[i] = mean(mySample(n,min,max));
   end;

/*Part D*/
   create sp4r.simulation  var {vec};
   append;
   close sp4r.simulation;

/*Part E*/
   submit;
      ods select basicmeasures histogram;
	  proc univariate data=sp4r.simulation;
         var vec;
		 histogram vec;
	  run;
   endsubmit;
quit;
