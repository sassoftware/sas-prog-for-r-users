/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s04*/

/*Part A*/
proc print data=sp4r.govtdemand;
run;

/*Part B*/
proc iml;
   use sp4r.govtDemand;
   read all into govt;
   close sp4r.govtDemand;

/*Part C*/
   start impute(colvec);
	  colvec[loc(colvec=.)] = mean(colvec);
	  return(colvec);
   finish impute;

/*Part D*/
   govtImputed = govt[,1]||impute(govt[,2])
      ||impute(govt[,3])||impute(govt[,4]);
   create sp4r.newGovt from govtImputed 
      [colname={year, agric, manu, labor}];
   append from govtImputed;
   close sp4r.newGovt;

/*Part E*/
   submit;
      proc print data=sp4r.newGovt;run;
	  proc corr data=sp4r.newGovt; 
         var agric manu labor; 
      run;
   endsubmit;
quit;
