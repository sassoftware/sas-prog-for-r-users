/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d06*/

/*Part A*/
proc iml;
   numberIterations=10000;
   call randseed(802);

/*Part B*/
   do iteration=1 to numberIterations;
      doors = {1 2 3};
      carDoor=sample(doors,1);

/*Part C*/
     *Pick door for Monty Hall to open;
     if carDoor=1 then openDoor=randfun(1,"Bernoulli",.5) + 2;
     else if carDoor=2 then openDoor=3;
     else if carDoor=3 then openDoor=2;

/*Part D*/
     *Determine door for switching strategy;
     if openDoor=2 then switchDoor=3;
     else if openDoor=3 then switchDoor=2;

/*Part E*/
     *Determine which strategy wins;
     if carDoor=1 then stayWin=1;
     else stayWin=0;

     if carDoor=switchDoor then switchWin=1;
     else switchWin=0;
	 /*switchWin=carDoor=switchDoor;*/

/*Part F*/
     *Collect results to a single matrix;
     results=results // (iteration || carDoor || openDoor || stayWin || switchWin);
   end;

/*Part H*/
   reset noname;
   resultsSubset = results[1:10,];
   print resultsSubset [colname={iteration carDoor openDoor 
      stayWin switchWin}];

   percentageWins=results[:,{4 5}];
   print percentageWins [colname={stay switch}];
quit;
