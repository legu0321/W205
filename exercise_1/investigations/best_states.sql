/**Q2**/

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
/**

DE      0.7200945437266215      0.21190572766951907     0.8042876551633542     0.6359014322898887
NH      0.7073278804737004      0.22528860963215142     0.7971494769831884     0.6175062839642124
VT      0.7027518399499247      0.21823679820346203     0.8068814966556384     0.5986221832442111
MT      0.6974946272499708      0.2267828416463149      0.7782054783843665     0.6167837761155751
CO      0.6974279162148407      0.23479847321457079     0.7624989491150501     0.6323568833146312

**/