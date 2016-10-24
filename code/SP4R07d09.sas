/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d09*/

/*Part A*/
proc iml;
   startTime = time();
   simulations = 1000;
   sampleSize = 20;

/*Part B*/
   simulationNumber = 1:simulations;
   each = j(simulations,1,sampleSize);
   simulationNumber = repeat(simulationNumber,each)`;

/*Part C*/
   call randseed(27606);
   total = simulations*sampleSize;
   beta0 = 5;
   beta1 = 2;
   xvals = randfun(total,"Uniform");
   x = xvals*20;
   error = randfun(total,"Normal",0,5);
   y = beta0 + beta1*x + error;

/*Part D*/
   create sp4r.simulation  var {simulationNumber x y};
   append;
   close sp4r.simulation;

/*Part E*/
   submit;
      ods select none;
      ods output ParameterEstimates=sp4r.params;
      proc reg data=sp4r.simulation;
	     by simulationNumber;
         model y=x;
      run;
	  ods select default;
   endsubmit;

/*Part F*/
   use sp4r.params;
   read all var {estimate} where (variable='Intercept') into beta0;
   close sp4r.params;

   use sp4r.params;
   read all var {estimate} where (variable='X') into beta1;
   close sp4r.params;

/*Part G*/
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
