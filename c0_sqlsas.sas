* working with sql;
* Reference: https://onlinecourses.science.psu.edu/stat482/node/39;
* Note: survey.sas7bdat is a special format of sas storage;
* There is a python package to read sas7bdat sas7bdat2.0.7;

LIBNAME testdata "/folders/myfolders/stats/";

PROC SQL;
    SELECT ID, SATM, SATV
    FROM testdata.survey;
RUN;

PROC PRINT DATA=testdata.survey;
RUN;
