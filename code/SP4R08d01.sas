/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R08d01*/

/*Part A*/
ods select basicmeasures histogram;
proc univariate data=sp4r.fish;
   var weight;
   histogram weight;
run;

/*Part B
proc iml;
   submit / r;
     install.packages("boot")
   endsubmit;
quit;*/

/*
NOTE: You must delete the SAS comments in the SUBMIT block.
The comments are passed to R and cause errors!
*/
/*Part C*/
proc iml;
   call ExportDataSetToR("sp4r.fish","fish");

/*Part D*/
   submit / r;
     library(boot)
	 set.seed(802)
	 numreps = 1000

      bootMean <- function(data,variable,index){
      attach(data)
      result <- mean(variable[index],na.rm=TRUE)
      detach(data)
      return(result)
      }

      results <- boot(data=fish,statistic=bootMean,
                    R=numreps,variable=Weight)

/*Part E*/
      boot.ci(results, conf=0.95, type="perc", index=1)
      plot(results)

/*Part F*/
      boots <- data.frame("boots"=results$t)
   endsubmit;

/*Part G*/
   call ImportDataSetFromR("sp4r.RData","boots");

   submit;
     proc print data=sp4r.RData (obs=10); 
     run;
   endsubmit;
quit;
