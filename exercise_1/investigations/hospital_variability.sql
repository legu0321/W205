
select a.measureid,b.measurename,stddev(score_regularized)  as std_score,count(*)
from temp_measures_scores_regularized a
join  etl_measures b
 on a.measureid=b.measureid
group by a.measureid,b.measurename
order by std_score desc
limit 10 ;

select a.measureid,b.measurename,stddev(score_regularized)  as std_score,count(*)
from temp_readmission_scores_regularized a
join  etl_measures b
 on a.measureid=b.measureid
group by a.measureid,b.measurename
order by std_score desc
limit 10 ;
