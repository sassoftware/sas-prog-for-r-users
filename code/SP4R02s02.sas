/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02s02*/

data sp4r.shelter3;
   infile datalines dlm='#';
   input Name $ Age Weight Color $ Cats $;
   datalines;
   Pluto#3#25#Black#No
   Lizzie#10#43#Tan#Yes
   Pesci#10#38#Brindle#No
;run;
