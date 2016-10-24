/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d02*/

/*Part A*/
proc iml;
   call randseed(27606);
   n = 20;
   beta0 = 5;
   beta1 = 2;

   xvals = j(n,1,0);
   call randgen(xvals,"Uniform");
   xvals = xvals*20;

   error = j(n,1,0);
   call randgen(error,"Normal",0,5);

   y = beta0 + beta1*xvals + error;
   print y beta0 beta1 xvals error;

/*Part B*/
   x = j(n,1,1)||xvals;
   xpx = x`*x;
   print x, xpx;

/*Part C*/
   call svd(u,q,v,xpx);
   xpxSVD = u*diag(q)*v`;
   print u q v xpxSVD;

/*Part D*/
   qInv = 1/q;
   qInvDiag = diag(qInv);
   print q qInv qInvDiag;

/*Part E*/
   betaHat = (v*qInvDiag*u`)*(x`*y);
   print betaHat;
quit;
