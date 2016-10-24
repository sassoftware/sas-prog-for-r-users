/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04s02*/

data sp4r.random;
   do q=0 to 10 by 1;
      pdf = pdf('Binomial',q,.8,10);
      cdf = cdf('Binomial',q,.8,10);
      quantile = quantile('Binomial',cdf,.8,10);
      output;
   end;
run;

proc print data=sp4r.random;
run;
