/**Q1**/

/**
Timely and Effective Care
**/
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

/**
Readmission
**/



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

/**

050424  0.8402883633848717      0.1418208867746482      0.9606730971157906     0.7199036296539527
050625  0.7956879708660831      0.22709278244011488     0.8283473167888744     0.7630286249432918
220077  0.7923222449426335      0.20313395769228984     0.8456556808771947     0.7389888090080723
330182  0.7849651852232395      0.2093323998579229      0.82673506751183       0.7431953029346491
130006  0.7814973719237736      0.24034823152881696     0.8220162403630872     0.7409785034844599
330214  0.777074145998476       0.2456619049886914      0.8155029192964197     0.7386453727005323
030103  0.77524406853137        0.22870572496501723     0.8110033584186773     0.7394847786440627
160029  0.7746045781798905      0.20838292493415414     0.7883471179458162     0.7608620384139648
340002  0.7733855058366613      0.23671862721804954     0.8316162839328548     0.7151547277404678
670025  0.7725360407642727      0.2564495023718553      0.8039581781826699     0.7411139033458756

**/

