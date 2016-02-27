
DROP TABLE measures_parquet;
CREATE TABLE measures_parquet AS 
SELECT MeasureName ,
MeasureID ,
Measure_Start_Quarter ,
Measure_Start_Date ,
Measure_End_Quarter , 
Measure_End_Date  
FROM measures;