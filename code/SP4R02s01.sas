/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R02s01*/

/*Part A*/
data sp4r.shelter;
   length Name $ 25 Color $ 10 Cats $ 3;
   input Name $ Age Weight Color $ Cats $;
   datalines;
   Pluto 3 25 Black No
   Lizzie 10 43 Tan Yes
   Pesci 10 38 Brindle No
;
run;

/*Part C*/
data sp4r.shelter2;
   length Name $ 25 Color $ 10 Cats $ 3;
   input Name $ Age Weight Color $ Cats $ @@;
   datalines;
   Pluto 3 25 Black No Lizzie 10 43 Tan Yes Pesci 10 38 Brindle No
;
run;



