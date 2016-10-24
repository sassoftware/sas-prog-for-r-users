/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d07*/

/*Part A*/
proc iml;
   start simpleRegFunc(n,beta0,beta1);
      xvals = randfun(n,"Uniform");
      xvals = xvals*20;
      error = randfun(n,"Normal",0,5);
      y = beta0 + beta1*xvals + error;
      x = j(n,1,1)||xvals;
      betaHat = inv(x`*x)*(x`*y);
      return(betaHat);
   finish;

/*Part B*/
   n = 20;
   reps = 1000;
   beta0 = j(reps,1,.);
   beta1 = j(reps,1,.);
   call randseed(27606);

/*Part C*/
   do i=1 to reps;
      betas = simpleRegFunc(n,5,2);
      beta0[i] = betas[1];
      beta1[i] = betas[2];
   end;

/*Part D*/
   mean0 = mean(beta0);
   sd0 = std(beta0);
   call qntl(percentiles0,beta0,{.025, .975});
   
   mean1 = mean(beta1);
   sd1 = std(beta1);
   call qntl(percentiles1,beta1,{.025, .975});

   out0 = mean0//sd0//percentiles0;
   reset noname;
   print out0[colname="Beta0" rowname={"Mean","Standard Deviation","LCL","UCL"}];

   out1 = mean1//sd1//percentiles1;
   print out1[colname="Beta1" rowname={"Mean","Standard Deviation","LCL","UCL"}];
quit;
