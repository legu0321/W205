DROP TABLE hospital;
CREATE EXTERNAL TABLE hospital (ProviderID STRING,
Hosp_Name  STRING,
Address  STRING,
City STRING,
State STRING,
Zip STRING,
County_Name STRING,
Phone_Number STRING,
Hosp_type STRING,
Hosp_ownership  STRING,
Emergency_Service STRING )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospital';



DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (ProviderID STRING,
Hosp_Name  STRING,
Address  STRING,
City STRING,
State STRING,
Zip STRING,
County_Name STRING,
Phone_Number STRING,
condition STRING,
MeasureID STRING,
MeasureName STRING,
Score STRING,
Sample STRING,
Footnote STRING,
Measure_Start_Date STRING,
Measure_End_Date STRING )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE readmission;
CREATE EXTERNAL TABLE readmission (ProviderID STRING,
Hosp_Name  STRING,
Address  STRING,
City STRING,
State STRING,
Zip STRING,
County_Name STRING,
Phone_Number STRING,
MeasureName STRING,
MeasureID STRING,
Compared_to_Nation STRING,
Denominator STRING,
Score STRING,
Lower_Estimate STRING,
Higher_Estimate STRING,
Footnote STRING,
Measure_Start_Date STRING,
Measure_End_Date STRING )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmission';

DROP TABLE measures;
CREATE EXTERNAL TABLE measures (
MeasureName STRING,
MeasureID STRING,
Measure_Start_Quarter STRING,
Measure_Start_Date STRING,
Measure_End_Quarter STRING, 
Measure_End_Date STRING )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';


DROP TABLE surveys_response;
CREATE EXTERNAL TABLE surveys_response (Provider_Number STRING,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP STRING,
County_Name STRING,
Communication_with_Nurses_Achievement_Points STRING,
Communication_with_Nurses_Improvement_Points STRING,
Communication_with_Nurses_Dimension_Score STRING,
Communication_with_Doctors_Achievement_Points STRING,
Communication_with_Doctors_Improvement_Points STRING,
Communication_with_Doctors_Dimension_Score STRING,
Responsiveness_of_Hospital_Staff_Achievement_Points STRING,
Responsiveness_of_Hospital_Staff_Improvement_Points STRING,
Responsiveness_of_Hospital_Staff_Dimension_Score STRING,
Pain_Management_Achievement_Points STRING,
Pain_Management_Improvement_Points STRING,
Pain_Management_Dimension_Score STRING,
Communication_about_Medicines_Achievement_Points STRING,
Communication_about_Medicines_Improvement_Points STRING,
Communication_about_Medicines_Dimension_Score STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score STRING,
Discharge_Information_Achievement_Points STRING,
Discharge_Information_Improvement_Points STRING,
Discharge_Information_Dimension_Score STRING,
Overall_Rating_of_Hospital_Achievement_Points STRING,
Overall_Rating_of_Hospital_Improvement_Points STRING,
Overall_Rating_of_Hospital_Dimension_Score STRING,
HCAHPS_Base_Score STRING,
HCAHPS_Consistency_Score STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_response';

--LOAD DATA inpath '/user/w205/hospital_compare/hospital.csv' overwrite INTO TABLE hospital;
--LOAD DATA inpath '/user/w205/hospital_compare/hospital.csv' overwrite INTO TABLE effective_care;
--LOAD DATA inpath '/user/w205/hospital_compare/hospital.csv' overwrite INTO TABLE readmission;
--LOAD DATA inpath '/user/w205/hospital_compare/hospital.csv' overwrite INTO TABLE measures;
--LOAD DATA inpath '/user/w205/hospital_compare/hospital.csv' overwrite INTO TABLE surveys_response;