/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d04*/

proc sql;
   select mean(gr_liv_area) into :gr_mean from sp4r.ameshousing;
quit;

proc glm data=sp4r.ameshousing plots=diagnostics;
   class heating_qc (ref='Fa');
   model saleprice = heating_qc|gr_liv_area / solution clparm;
   lsmeans heating_qc / at gr_liv_area=&gr_mean pdiff adjust=tukey cl;
   estimate 'My Estimate' intercept 1 heating_qc 1 0 0 0 
      gr_liv_area &gr_mean heating_qc*gr_liv_area &gr_mean;
run;quit;
