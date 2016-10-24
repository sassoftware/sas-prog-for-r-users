/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s08*/

/*Part A*/
proc iml;
   simulations = 1000;
   sampleSize = 30;
   min = 5;
   max = 10;
   call randseed(802);

/*Part B*/
   simulationNumber = 1:simulations;
   each = j(simulations,1,sampleSize);
   simulationNumber = repeat(simulationNumber,each)`;

/*Part C*/
   total = simulations*sampleSize;
   vec = randfun(total,"Uniform",min,max);

/*Part D*/
   create sp4r.simulation var {simulationNumber vec};
   append;
   close sp4r.simulation;

/*Part E*/
   submit;
      ods select none;
      proc means data=sp4r.simulation;
         by simulationNumber;
         var vec;
         output out=sp4r.out mean=mean;
      run;
      ods select default;
   endsubmit;

/*Part F*/
   use sp4r.out;
   read all var {mean} into means;
   close sp4r.out;

/*Part G*/
   mean = mean(means);
   sd = std(means);
   call qntl(percentiles,means,{.025, .975});

   out = mean//sd//percentiles;
   reset noname;
   print out[colname="Mu" 
      rowname={"Mean","Standard Deviation","LCL","UCL"}];
quit;
