/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s02*/

/*Part A*/
proc iml;
   call randseed(27606);
   n = 20;
   beta0 = 3;
   beta1 = 2;
   beta2 = -1;
   xvals1 = randfun(n,"Uniform");
   xvals1 = xvals1*20;
   xvals2 = randfun(n,"Uniform");
   xvals2 = (xvals2*20) + 10;
   error = randfun(n,"Normal",0,5);
   y = beta0 + beta1*xvals1 + beta2*xvals2 + error;
   print y beta0 beta1 beta2 xvals1 xvals2 error;

/*Part B*/
   x = j(n,1,1)||xvals1||xvals2;
   betaHat = inv(x`*x)*(x`*y);
   print x, betaHat;
   *Alternative SAS Function;
   *betaHat = solve( (x`*x)*(x`*y) );
   *print betaHat;

/*Part C*/
   pred = x*betaHat;
   sse = sum( (y-pred)##2 );
   sigma2Hat = sse / (n-1);
   sigmaHat = sqrt(sigma2Hat);
   print sigma2Hat sigmaHat;
quit;
