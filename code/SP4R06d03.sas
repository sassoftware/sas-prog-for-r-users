/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R06d03*/

proc glm data=sp4r.ameshousing plots=diagnostics;
   class heating_qc (ref='Fa') central_air (ref='N');
   model saleprice = heating_qc|central_air / solution;
   *Alternative MODEL statement syntax;
   *model saleprice = heating_qc central_air heating_qc*central_air;
   lsmeans heating_qc|central_air;
   estimate 'Main Effect EX vs GD' heating_qc 1 -1 0 0 
      heating_qc*central_air .5 .5 -.5 -.5 0 0 0 0/ e;
run;quit;
