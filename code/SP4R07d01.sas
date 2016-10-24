/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07d01*/

/*Part A*/
proc iml;
   items       ={'Groceries','Utilities','Rent','Car Expenses',
                   'Fun Money','Personal Expenses'};
   weeks       ={'Week 1','Week 2','Week 3','Week 4'};
   amounts     ={ 96  78  82  93,
                    61  77  62  68,
                    300 300 300 300,
                    25  27  98  18,
                    55  34  16  53,
                    110 85  96  118};
   weeklyIncome={900 850 1050 950};
   print items amounts weeklyIncome;
   print items, amounts, weeklyIncome;

/*Part B*/
   reset noname;
   weeklyTotals=amounts[+,];
   print "Total Expenses for Each Week", weeklyTotals [colname=weeks format=dollar8.2];

/*Part C*/
   itemTotals=amounts[,+];
   print "Total Expenses for Each Item", itemTotals[rowname=items format=dollar8.2];

/*Part D*/
   weeklyPercentage=amounts/weeklyIncome;
   print "Percentage of income spent on each item, by week",
     weeklyPercentage[rowname=items colname=weeks format=percent7.2];

/*Part E*/
   monthlyIncome  =weeklyIncome[+];
   itemProportion =itemTotals/monthlyIncome;
   print "Each Item as a Percentage of Monthly Income",
     itemProportion[rowname=items format=percent7.2];
quit;
