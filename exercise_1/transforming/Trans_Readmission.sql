
DROP TABLE etl_readmission;
CREATE TABLE etl_readmission AS
SELECT ProviderID ,
MeasureID ,
Compared_to_Nation ,
Denominator ,
cast(Score as float) as Score ,
1-cast(score as float)/100 as score_adjust,
Lower_Estimate ,
Higher_Estimate ,
Footnote
FROM readmission 
WHERE score<>'Not Available'  ;



