/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d05*/

/*Part A*/
proc iml;
   call randseed(27606);
   n = 20;
   beta0 = 5;
   beta1 = 2;
   xvals = randfun(n,"Uniform");
   xvals = xvals*20;
   error = randfun(n,"Normal",0,5);
   y = beta0 + beta1*xvals + error;
   x = j(n,1,1)||xvals;
   betaHat = inv(x`*x)*(x`*y);
   print betaHat;

/*Part B*/
   create sp4r.betaData var{xvals y};
   append;
   close sp4r.betaData;

/*Part C*/
   submit;
      ods select fitplot parameterestimates;
      proc reg data=sp4r.betaData;
         model y = xvals;
      run;
   endsubmit;
quit;
