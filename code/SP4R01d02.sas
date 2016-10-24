/*--------------------------------------------------*/
/* SAS Programming for R Users - code for exercises */
/* Copyright 2016 SAS Institute Inc.                */
/*--------------------------------------------------*/

/*SP4R01d02*/

/*Hello!*/
/*Welcome to SP4R!*/

/*This file creates the course library and data*/

/*Change this path to the appropriate location*/
%let path = s:\workshop;

/*
This course will use the library name sp4r.
Each data set name will begin with the library name followed by a period.
For example, to save a data set called 'dogs' in the SP4R library
we will use the name sp4r.dogs
*/
libname sp4r "&path";

/*
This statement runs the SP4R01d03.sas file
and creates all the data for the course 
and stores it in the sp4r library.
*/
%include "&path\SP4R01d03.sas";
