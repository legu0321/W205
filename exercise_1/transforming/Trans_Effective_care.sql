
DROP TABLE etl_effective_care;
CREATE TABLE etl_effective_care AS
SELECT ProviderID ,
condition ,
MeasureID ,
Score ,
Sample ,
Footnote,
case   
when score='Low (0 - 19,999 patients annually)' then 1
when score='Medium (20,000 - 39,999 patients annually)' then 2
when score='High (40,000 - 59,999 patients annually)' then 3
when score='Very High (60,000+ patients annually)' then 4
ELSE cast(score as float) END score_adjust
FROM effective_care
WHERE score<>'Not Available'  ;

