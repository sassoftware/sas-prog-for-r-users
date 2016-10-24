/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R08s01*/

/*Part A*/
proc iml;
   call ExportDataSetToR("sp4r.fish","fish");

/*Part B*/
   submit / r;
      fit <- lm(Weight ~ Height + Width, data=fish)
      summary(fit)
   endsubmit;

/*Part C*/
   call ImportMatrixFromR(r_Coefficients,"fit$coefficients");
/*Part D*/
   submit;
      ods select none;
      proc reg data=sp4r.fish outest=sp4r.betas;
         model weight = height width;
      run;quit;
	    ods select default;
   endsubmit;

/*Part E*/
   use sp4r.betas;
   read all var {intercept height width} into sas_Coefficients;
   close sp4r.betas;

/*Part F*/
   coefficients = sas_coefficients` || r_coefficients ||
       (sas_coefficients` - r_coefficients);

   reset noname;
   coefficientNames = {SAS_Coefficients R_Coefficients Difference};
   print coefficients[colname=coefficientNames];
quit;
