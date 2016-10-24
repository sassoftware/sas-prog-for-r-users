/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s06*/

/*Part A*/
proc iml;
   n=23;
   numberIterations=1000;
   call randseed(802);
   pair = j(numberIterations,1,.);
   do iteration=1 to numberIterations;

/*Part B*/
      dates = 1:365;
      birthDates=sample(dates,n);

/*Part C*/
      uniqueDates=unique(birthDates);
/*Part D*/
     if ncol(uniqueDates) < n then pair[iteration]=1;
     else pair[iteration]=0;
  end;

/*Part E*/
   proportion=pair[:];
   print proportion;
quit;

/*Part F*/
proc iml;
   n=23;
   numberIterations=1000;
   call randseed(23571113);
   prob=j(364,1,1/365);
   birthDates=j(numberIterations,n,.);
   call randgen(birthDates,"Table",prob);

   rowUnique=countunique(birthDates,"ROW");
   proportion=(rowUnique < n)[+] / numberIterations;
   print proportion;
quit;
