/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R05d05*/

/*Part A*/
%macro mymac(dist,param1,param2=,n=100,stats=no,plot=no);

/*Part B*/
%if &dist= %then %do;
   %put Dist is a required argument;
   %return;
%end;

%if &param1= %then %do;
   %put Param1 is a required argument;
   %return;
%end;

/*Part C*/
%if &param2= %then %do;
   data random (drop=i);
      do i=1 to &n;
         y=rand("&dist",&param1);
	     x+1;
	     output;
      end;
   run;
%end;

%else %do;
   data random (drop=i);
      do i=1 to &n;
         y=rand("&dist",&param1,&param2);
	     x+1;
	     output;
      end;
   run;
%end;

/*Part D*/
%if %upcase(&stats)=YES %then %do;
   proc means data=random mean std;
      var y;
   run;
%end;

/*Part E*/
%if %upcase(&plot)=YES %then %do;
   proc sgplot data=random;
      histogram y / binwidth=1;
	  density y / type=kernel;
   run;
%end;

%mend;

/*Part F*/
%mymac(param1=0.2,stats=yes)

/*Part G*/
%mymac(dist=Geometric,param1=0.2,param2=,stats=yes)

/*Part H*/
options mprint;
%mymac(dist=Normal,param1=100,param2=10,n=1000,plot=yes)
