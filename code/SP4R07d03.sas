/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d03*/

/*Part A*/
proc iml;
   start simpleRegFunc(xvals, yvals);
      n = nrow(xvals);
      x = j(n,1,1)||xvals;
      y = yvals;

      betaHat = inv(x`*x)*(x`*y);
      return(betaHat);
   finish;

/*Part B*/
   call randseed(27606);
   n = 20;
   beta0 = 5;
   beta1 = 2;
   xvals = randfun(n,"Uniform");
   xvals = xvals*20;
   error = randfun(n,"Normal",0,5);
   y = beta0 + beta1*xvals + error;

   betas = simpleRegFunc(xvals,y);
   print betas;

/*Part C*/
   start simpleRegSub(betaHat, sigmaHat, xvals, yvals);
      n = nrow(xvals);
      x = j(n,1,1)||xvals;
      y = yvals;

      betaHat = inv(x`*x)*(x`*y);
      pred = x*betaHat;
      sse = sum( (y-pred)##2 );
      sigma2Hat = sse / (n-1);
      sigmaHat = sqrt(sigma2Hat);
   finish;

/*Part D*/
   call simpleRegSub(betas,sHat,xvals,y);
   print betas sHat;

/*Part E*/
   reset storage=imlcat;
   store;
   show storage;
quit;


