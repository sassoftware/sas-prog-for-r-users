/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s03*/

/*Part A*/
proc iml;
   start standardize(x); 
      n=nrow(x);   		
      mean=x[:,];            /* means for all columns           */ 
      xbar=repeat(mean,n,1); /* n rows of means                 */
      x=x-xbar;              /* center x to mean zero           */ 
      stdv=std(x);           /* standard deviations for columns */ 
      x=x/stdv;              /* scale to std dev 1              */ 
      return(x);
   finish;

/*Part B*/
   n = 10;
   call randseed(802);
   mymat = randfun(n,"Normal",5,5)
      ||randfun(n,"Uniform",10,15)||randfun(n,"Exponential",7);
   print mymat;
   stand = standardize(mymat);
   print stand;
quit;

/*Part C*/
proc iml;   
   start standsub(stand,mean,stdv,x); 
      n=nrow(x);   		
      mean=x[:,];            /* means for all columns           */ 
      xbar=repeat(mean,n,1); /* n rows of means                 */
      x=x-xbar;              /* center x to mean zero           */ 
      stdv=std(x);           /* standard deviations for columns */ 
      stand=x/stdv;          /* scale to std dev 1              */ 
   finish;

/*Part D*/
   n = 10;
   call randseed(802);
   mymat = randfun(n,"Normal",5,5)
      ||randfun(n,"Uniform",10,15)||randfun(n,"Exponential",7);
   call standsub(standardized,m,s,mymat);
   print m, s, standardized;
quit;
