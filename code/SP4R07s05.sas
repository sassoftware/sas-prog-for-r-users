/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s05*/

/*Part A*/
proc iml;
   use sp4r.ameshousing;
   read all var {saleprice overall_qual gr_liv_area garage_area 
      basement_area deck_porch_area age_sold} into imlAmes;
   close sp4r.ameshousing;

/*Part B*/
   corrAmes = corr(imlAmes);
   print corrAmes;

/*Part C*/
   varNames = {"Sale Price" "Overall Quality" "Ground Living Area" 
      "Garage Area" "Basement Area" "Deck Porch Area" 
      "Age Sold (years)" };
   call heatmapcont(corrAmes) xvalues=varNames yvalues=varNames 
      colorramp="Temperature" title="Heatmap for Ames Data";
quit;
