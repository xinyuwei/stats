* Use options to specify page length and width;
OPTIONS PS = 58 LS=72;

* Data statement;
DATA HTWT;
INPUT GENDER $ HEIGHT WEIGHT;
DATALINES;   /*TODO: find out the difference between CARDS and DATALINES;*/
    M 68 153
    F 61 99
    F 63 115
    M 70 205
    M 69 170
    F 65 125
    M 72 220
    M 78 135
    F 71 99
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

* Use MEANS with additional options, must specify everything, default is no longer default;
* STD: standard devation, measure of the data spread;
* STDERR: standard error, measure of the confidence interval of the mean, 68-95-99.7;
PROC MEANS MAXDEC=3 N NMISS MEAN STD STDERR MIN MAX SUM VAR CV SKEWNESS KURTOSIS T PRT;
    VAR HEIGHT WEIGHT;   /*TODO: why the colors different, but runs OK  */
RUN;

*Get frequencies;
PROC FREQ;
    TITLE 'Frequencies of Gender';
    TABLES GENDER;

*Get barchart;
PROC CHART;
    TITLE 'Bar Charts for Categorical Data: Gender';
    VBAR GENDER;
    HBAR GENDER;
RUN;

*Use equally spaces intervals - LEVELS;
*Each bar centered at the mid point of the interval;
*Alternative1: VBAR HEIGHT / MIDPOINTS=50 TO 80 BY 10;
*Alternative2: VBAR WEEK /DISCRETE;

PROC CHART;
    TITLE 'Bar Charts for Continuous Data: Height, use LEVELS';
    VBAR HEIGHT / LEVELS = 3;
RUN;

PROC PLOT;
    TITLE 'Scatterplot of Weight vs. Height';
    PLOT HEIGHT * WEIGHT;
RUN;

PROC CORR DATA=HTWT;
    TITLE 'Correlation Between Height and Weight';
    VAR HEIGHT WEIGHT;
RUN;

PROC REG;
    TITLE "Regression Line for HT/WT Data";
    MODEL WEIGHT = HEIGHT;  /*X(s) = y */
RUN;
