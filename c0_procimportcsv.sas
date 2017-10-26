* Use options to specify page length and width;
OPTIONS PS = 58 LS=72;

* Import data using PROC IMPORT;
PROC IMPORT 
    DATAFILE='/folders/myfolders/stats/cars.csv' 
    OUT = work.cars
    DBMS = CSV
    REPLACE;  /*Permission to rewrite*/
    ;
RUN;

* This decode is not successful
* TODO: find the correct location for the data decoding statement
* DATA work.cars;
*     IF 0<= MPG_City <= 25 THEN MPGROUP = 1;
*        ELSE IF MPG_City > 25 THEN MPGROUP=2;
*        ELSE MPGROUP = 3;
* RUN;

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
    VAR MPG_Highway MPG_City;
RUN;

PROC FREQ;
    TABLES Origin;
RUN;

* PROC UNIVARIATE NORMAL PLOT;  /*Note: NORMAL PLOT takes a lot longer, 5-10 seconds*/
*    VAR MPG_City MPG_Highway;
*RUN;



