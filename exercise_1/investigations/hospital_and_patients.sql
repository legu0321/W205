
create  table  hospital_procedure_variability as
select providerid,stddev(score_regularized)  as std_score,count(*)
from temp_measures_scores_regularized 
group by providerid;

create  table  hospital_readmission_variability as
select providerid,stddev(score_regularized)  as std_score,count(*)
from temp_readmission_scores_regularized 
group by providerid;

--hospital effective variablity vs Base Score 
select corr(std_score,HCAHPS_Base_Score)  
from hospital_procedure_variability a
 join etl_surveys_response  b
  on a.providerid=b.Provider_Number;


--hospital readmission variablity vs Base Score 

select corr(std_score,HCAHPS_Base_Score) 
from hospital_readmission_variability a
 join etl_surveys_response  b
  on a.providerid=b.Provider_Number;
 
--hospital effective variablity vs Overall_Rating_of_Hospital_Achievement_Points Score 
select corr(std_score,Overall_Rating_of_Hospital_Achievement_Points) 
from hospital_procedure_variability a
 join etl_surveys_response  b
  on a.providerid=b.Provider_Number;
  
--hospital readmission variablity vs Overall_Rating_of_Hospital_Achievement_Points 
select corr(std_score,Overall_Rating_of_Hospital_Achievement_Points)  
from hospital_readmission_variability a
 join etl_surveys_response  b
  on a.providerid=b.Provider_Number;
 
--hospital effective variablity vs Overall_Rating_of_Hospital_Dimension_Score Score   
 select corr(std_score,Overall_Rating_of_Hospital_Dimension_Score)   
from hospital_procedure_variability a
 join etl_surveys_response  b
  on a.providerid=b.Provider_Number;
--hospital readmission variablity vs Overall_Rating_of_Hospital_Dimension_Score   
select corr(std_score,Overall_Rating_of_Hospital_Dimension_Score)   
from hospital_readmission_variability a
 join etl_surveys_response  b
  on a.providerid=b.Provider_Number;
   
     
 --hospital score vs HCAHPS_Base_Score
 select corr(score_effective+score_readmission,HCAHPS_Base_Score)  
from prob1_combined a
 join etl_surveys_response  b
  on a.providerid=b.Provider_Number;
  --hospital score vs  Overall_Rating_of_Hospital_Achievement_Points
select corr(score_effective+score_readmission,Overall_Rating_of_Hospital_Achievement_Points)  
from prob1_combined a
 join etl_surveys_response b
  on a.providerid=b.Provider_Number;

--hospital score vs Overall_Rating_of_Hospital_Achievement_Points
select corr(score_effective+score_readmission,Overall_Rating_of_Hospital_Dimension_Score)  
from prob1_combined a
 join etl_surveys_response b
  on a.providerid=b.Provider_Number;

