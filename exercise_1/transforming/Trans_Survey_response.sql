
DROP TABLE etl_surveys_response;
CREATE  TABLE etl_surveys_response AS
SELECT Provider_Number ,
Communication_with_Nurses_Achievement_Points ,
Communication_with_Nurses_Improvement_Points ,
Communication_with_Nurses_Dimension_Score ,
Communication_with_Doctors_Achievement_Points ,
Communication_with_Doctors_Improvement_Points ,
Communication_with_Doctors_Dimension_Score ,
Responsiveness_of_Hospital_Staff_Achievement_Points ,
Responsiveness_of_Hospital_Staff_Improvement_Points ,
Responsiveness_of_Hospital_Staff_Dimension_Score ,
Pain_Management_Achievement_Points ,
Pain_Management_Improvement_Points ,
Pain_Management_Dimension_Score ,
Communication_about_Medicines_Achievement_Points ,
Communication_about_Medicines_Improvement_Points ,
Communication_about_Medicines_Dimension_Score ,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points ,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points ,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score ,
Discharge_Information_Achievement_Points ,
Discharge_Information_Improvement_Points ,
Discharge_Information_Dimension_Score ,
Overall_Rating_of_Hospital_Achievement_Points ,
Overall_Rating_of_Hospital_Improvement_Points ,
Overall_Rating_of_Hospital_Dimension_Score ,
HCAHPS_Base_Score ,
HCAHPS_Consistency_Score 
FROM surveys_response;