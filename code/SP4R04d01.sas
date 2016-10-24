/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04d01*/

/*Part A*/
data sp4r.random (drop=i);
   call streaminit(123);
   do i=1 to 10;
      rnorm = rand('Normal',20,5);
      rbinom = rand('Binomial',.25,1);
      runif = rand('Uniform')*10;
      rexp = rand('Exponential')*5;
      output;
   end;
run;

proc print data=sp4r.random;
run;

/*Part B*/
data sp4r.random;
   call streaminit(123);
   set sp4r.random;
   rgeom = rand('Geometric',.1);
run;

proc print data=sp4r.random;
run;

/*Part C*/
data sp4r.doloop (drop=j);
   call streaminit(123);
   do group=1 to 5;
      do j=1 to 3;
         rpois = rand('Poisson',25);
         rbeta = rand('Beta',.5,.5);
         seq+1;
         output;
      end;
   end;
run;

proc print data=sp4r.doloop;
run;

/*Part D*/
data sp4r.quants;
   do q=-3 to 3 by .5;
      pdf = pdf('Normal',q,0,1);
      cdf = cdf('Normal',q,0,1);
      quantile = quantile('Normal',cdf,0,1);
      output;
   end;
run;

proc print data=sp4r.quants;
run;
