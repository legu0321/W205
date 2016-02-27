DROP TABLE etl_hospital;
CREATE  TABLE etl_hospital as
SELECT 
ProviderID ,
Hosp_Name  ,
Address  ,
City ,
State ,
Zip ,
County_Name ,
Phone_Number ,
Hosp_type ,
Hosp_ownership  ,
Emergency_Service  
FROM hospital;
