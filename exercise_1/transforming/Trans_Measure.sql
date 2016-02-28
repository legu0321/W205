
DROP TABLE etl_measures;
CREATE TABLE etl_measures AS 
SELECT MeasureName ,
MeasureID ,
Measure_Start_Quarter ,
Measure_Start_Date ,
Measure_End_Quarter , 
Measure_End_Date  
FROM measures;