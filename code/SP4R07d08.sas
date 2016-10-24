/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d08*/

/*Part A*/
proc iml;
   start simpleRegSub(xvals,yvals,n);
      beta0 = 5;
      beta1 = 2;
      xvals = randfun(n,"Uniform");
      xvals = xvals*20;
      error = randfun(n,"Normal",0,5);
      yvals = beta0 + beta1*xvals + error;
   finish;

/*Part B*/
   n = 20;
   reps = 1000;
   beta0 = j(reps,1,.);
   beta1 = j(reps,1,.);
   call randseed(27606);
   startTime = time();

/*Part C*/
   do i=1 to reps;
      call simpleRegSub(x,y,n);

      create sp4r.simulation  var {x y};
      append;
      close sp4r.simulation;

/*Part D*/
      submit;
         ods select none;
         ods output ParameterEstimates=sp4r.params;
         proc reg data=sp4r.simulation;
            model y=x;
         run;
         ods select default;
      endsubmit;

/*Part E*/
      use sp4r.params;
      read all var {estimate} into estimates;
      close sp4r.params;

      beta0[i]=estimates[1];
      beta1[i]=estimates[2];
   end;

/*Part F*/
   mean0 = mean(beta0);
   sd0 = std(beta0);
   call qntl(percentiles0,beta0,{.025, .975});
   
   mean1 = mean(beta1);
   sd1 = std(beta1);
   call qntl(percentiles1,beta1,{.025, .975});

   out0 = mean0//sd0//percentiles0;
   reset noname;
   print out0[colname="Beta0" 
      rowname={"Mean","Standard Deviation","LCL","UCL"}];

   out1 = mean1//sd1//percentiles1;
   print out1[colname="Beta1" 
      rowname={"Mean","Standard Deviation","LCL","UCL"}];

   total = time() - startTime;
   print total[colname="Elapsed Time"];
quit;
