/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R07s01*/

proc iml;
   items         ={'Groceries','Utilities','Rent','Car Expenses',
                     'Fun Money','Personal Expenses'};
   weeks         ={'Week 1','Week 2','Week 3','Week 4'};
   amounts       ={96  78  82  93,
                   61  77  62  68,
                   300 300 300 300,
                   25  27  98  18,
                   55  34  16  53,
                   110 85  96  118};
   weeklyIncome  ={900 850 1050 950};
   weeklyExpenses=amounts[+,];

/*Part A*/
   proportionIncomeSpent=weeklyExpenses / weeklyIncome;
   reset noname;
   print "Proportion of income spent each week",
     proportionIncomeSpent[colname=weeks format=percent7.2];

/*Part B*/
   proportionIncomeSaved=1 - proportionIncomeSpent;
   print "Proportion of income saved each week",
     proportionIncomeSaved[colname=weeks format=percent7.2];

/*Part C*/
   proportionSpentPerItem=amounts/weeklyIncome;
   print "Percentage of income spent on each item, by week",
     proportionSpentPerItem [rowname=items 
     colname=weeks format=percent7.2];

/*Part D*/
   weeklyExpenseChange={. . .,
                          . . .,
                          . . .,
                          . . .,
                          . . .,
                          . . .};

   weeklyExpenseChange [,1]=amounts[,2] - amounts[,1];
   weeklyExpenseChange [,2]=amounts[,3] - amounts[,2];
   weeklyExpenseChange [,3]=amounts[,4] - amounts[,3];

   print "Change in spending from previous week, by item",
     weeklyExpenseChange  [rowname=items 
     colname={"Week 2","Week 3", "Week 4"}];
quit;
