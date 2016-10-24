/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R00d00*/

/*This program creates the SP4R library and connects it to the saved data sets.*/

/*Change this path to the appropriate location*/
%let path = s:\workshop;

/*
This course will use the library name sp4r.
Each data set name will begin with the library name followed by a period.
For example, to save a data set called 'dogs' in the SP4R library
we will use the name sp4r.dogs
*/
libname sp4r "&path";

