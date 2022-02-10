cas mySession sessopts=(caslib=casuser timeout=1800 locale="en_US" metrics="true");
caslib _all_ assign;
options casdatalimit=ALL;


data casuser.ameshousing3;
set STAT1.AMESHOUSING3;
run; 


/*st103d01.sas*/  /*Part A*/
ods graphics off;
proc means data=casuser.ameshousing3
           mean var std nway;
    class Season_Sold Heating_QC;
    var SalePrice;
    format Season_Sold Season.;
    title 'Selected Descriptive Statistics';
run;

/*st103d01.sas*/  /*Part B*/
proc sgplot data=casuser.ameshousing3;
    vline Season_Sold / group=Heating_QC 
                        stat=mean 
                        response=SalePrice 
                        markers;
    format Season_Sold season.;
run; 

/*st103d01.sas*/  /*Part C*/
ods graphics on;

proc glm data=casuser.ameshousing3 order=internal;
    class Season_Sold Heating_QC;
    model SalePrice = Heating_QC Season_Sold;
    lsmeans Season_Sold / diff adjust=tukey;
    format Season_Sold season.;
    title "Model with Heating Quality and Season as Predictors";
run;
quit;

title;


/*****************************************************************************/
/*  Terminate the specified CAS session (mySession). No reconnect is possible*/
/*****************************************************************************/

*cas mySession terminate;