
--caulcate the avergae score and standard deviaitions by state for timely and effective care.  
create  table  prob2_part1 as
select b.state,count(*) measure_count,avg(score_regularized) as avg_score,stddev(score_regularized) as std_score
from temp_measures_scores_regularized a
 join etl_hospital  b
  on a.providerid=b.providerid
group by b.state;

--caulcate the avergae score and standard deviaitions by state for readmission. 
create  table  prob2_part2 as
select b.state,count(*) measure_count,avg(score_regularized) as avg_score,stddev(score_regularized) as std_score
from temp_readmission_scores_regularized a
 join etl_hospital b
  on a.providerid=b.providerid
group by b.state;

 
select a.state,(a.avg_score+b.avg_score)/2 as score, (a.std_score+b.std_score)/2 as std ,a.avg_score,b.avg_score
from prob2_part1 a
 join prob2_part2 b
  on a.state =b.state
order by a.avg_score+b.avg_score desc
limit 5;  
