/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R04d04*/

/*Part A*/
data sp4r.multi;
   call streaminit(123);
   do Sex='F', 'M';
      do j=1 to 1000;
         if sex='F' then height = rand('Normal',66,2);
         else height = rand('Normal',72,2);
         output;
      end;
   end;
run;

/*Part B*/
proc sgpanel data=sp4r.multi;
   panelby sex;
   histogram height;
   density height / type=normal;
   title 'Heights of Males and Females';
   colaxis label='Height';
run;
title;

/*Part C*/
ods layout Start rows=1 columns=3 row_height=(1in) column_gutter=0;

ods region row=1 column=1;
proc sgplot data=sp4r.multi (where= (sex='F'));
   histogram height / binwidth=.5;
   title 'Histogram of Female Heights';
run;
title;

ods region row=1 column=2;
proc sgplot data=sp4r.multi (where= (sex='F'));
   density height / type=kernel;
   title 'Density Estimate of Female Heights';
run;
title;

ods region row=1 column=3;
proc sgplot data=sp4r.multi (where= (sex='F'));
   hbox height;
   title 'Boxplot of Female Hieghts';
run;
title;

ods layout end;
