
DROP TABLE etl_readmission;
CREATE TABLE etl_readmission AS
SELECT ProviderID ,
MeasureID ,
Compared_to_Nation ,
Denominator ,
cast(Score as float) as Score ,
Lower_Estimate ,
Higher_Estimate ,
Footnote
FROM readmission 
WHERE score<>'Not Available'  ;



