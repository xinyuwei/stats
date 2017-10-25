* Use options to specify page length and width;
OPTIONS PS = 58 LS=72;

* Import data using PROC IMPORT;
PROC IMPORT 
    DATAFILE='/folders/myfolders/cars.csv' 
    OUT = work.cars
    DBMS = CSV
    REPLACE;  /*Permissive to rewrite*/
    ;
RUN;


* Use proc contents to display data set information;
PROC CONTENTS;
RUN;

PROC PLOT;
    PLOT MPG_Highway * MPG_City=Cylinders;
RUN;

PROC SORT;
     BY Make;
RUN;

PROC CORR;
    BY Make;
    VAR MPG_Highway MPG_City;
RUN;

* PROC UNIVARIATE NORMAL PLOT;  /*Note: NORMAL PLOT takes a lot longer, 5-10 seconds*/
*    VAR MPG_City MPG_Highway;
*RUN;



