* Use PROC FORMAT to recode data
* Reference: Chapter 3 &4: Questionare analysis, date and longitudes
* Need to check updates

* Use options to specify page length and width;
OPTIONS PS = 58 LS=72;

*Use format statement to adding value labels, TODO: this did not seem to work check!;
PROC FORMAT;
    VALUE $GENDER "M" = "MALE" "F"="FEMALE";  /*Must use $ for character variables*/
RUN;

* Data statement;
DATA HTWT;
INPUT GENDER $ HEIGHT WEIGHT;

* Decode weight into groups using IF-THEN;
IF 0<= WEIGHT <= 100 THEN WTGROUP = 1;
    ELSE IF 100< WEIGHT <= 200 THEN WTGROUP = 2;
    ELSE IF 200< WEIGHT <= 300 THEN WTGROUP = 3;
    ELSE WTGROUP = 4;

* Label data
LABEL GENDER = "GENDER: MALE/FEMALE";
LABEL HEIGHT = "HEIGHT: IN CENTIMERS";
LABEL WEIGHT = "WEIGHT: IN KG";
LABEL WTGROUP = "WEIGHT GROUP";

DATALINES;   
    M 68 153
    F 61 99
    F 63 115
    M 70 205
    M 69 170
    F 65 125
    M 72 220
    M 78 135
    F 71 -99
    F 73 151
    M 60 215
    M 79 107
    F 75 152
    M 62 202
    ;
RUN;

* Use MEANS procedure to get descriptive statistics of numerical data;
PROC MEANS;
RUN;

* Use FREQ procedure to get descriptive statistics of categorical data;
PROC FREQ;
    TABLES GENDER;
    TABLES WTGROUP;
    TABLES GENDER*WTGROUP /CHISQ;  /*two-way frequency table with chi-square*/
* Why look at chisq here? We ask a question: is WTGROUP correlate with GENDER?;
* chisq is a test on variance to answer this question. ;
* TODO: added more data records, refresh chi-square; 
RUN;

