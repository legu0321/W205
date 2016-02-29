
--Timely and Effective Care

--in order to regularize socre of different questions, I need to get the minimum score and score range for each question 
create  table   temp_measures_scores as 
select measureid,min(score_adjust) as min_score,max(score_adjust)-min(score_adjust) as score_range, avg(score_adjust) as avg_score
from  etl_effective_care
group by measureid ;

--transform the score to a scale of 0-1 
create  table   temp_measures_scores_regularized as 
select a.*,(a.score_adjust-min_score)/cast(score_range as float) as score_regularized,  (avg_score-min_score)/cast(score_range as float)  as avg_score_regularized
from etl_effective_care a
 join temp_measures_scores b
  on a.MeasureID=b.MeasureID;
 
--caulcate the avergae score and standard deviaitions by store. Here I filtered out hospitals that reported less than 24 scores
create table prob1_part1 as 
select providerid,count(*) measure_count,avg(score_regularized) as avg_score,stddev(score_regularized) as std_score
from temp_measures_scores_regularized
group by providerid 
having count(*)>24;


--Readmission




--in order to regularize socre of different questions, I need to get the minimum score and score range for each question 
create  table   temp_readmission_scores  as 
select measureid,min(score_adjust) as min_score,max(score_adjust)-min(score_adjust) as score_range, avg(score_adjust) as avg_score
from  etl_readmission
group by measureid ;

--transform the score to a scale of 0-1 
create  table   temp_readmission_scores_regularized  as 
select a.*,(a.score_adjust-min_score)/cast(score_range as float) as score_regularized,  (avg_score-min_score)/cast(score_range as float)  as avg_score_regularized
from etl_readmission a
 join temp_readmission_scores b
  on a.MeasureID=b.MeasureID;

--caulcate the avergae score and standard deviaitions by store. Here I filtered out hospitals that reported less than 6 scores
create  table  prob1_part2 as
select providerid,count(*) measure_count,avg(score_regularized) as avg_score,stddev(score_regularized) as std_score
from temp_readmission_scores_regularized
group by providerid 
having count(*)>6;

--combine the two results  get the top 10 ranked hospital by selecting the max sum of score
create table prob1_combined as 
select a.providerid,a.avg_score as score_effective, b.avg_score as score_readmission, a.std_score as std_effective,b.std_score as std_admission 
from prob1_part1 a
 join prob1_part2 b
  on a.providerid =b.providerid;

--get the top 10 ranked hospital by selecting the max sum of score
select providerid,(score_effective+score_readmission)/2 as score, (std_effective+std_admission)/2 as std,score_effective,score_readmission
from prob1_combined
order by score_effective+score_readmission desc
limit 10;
