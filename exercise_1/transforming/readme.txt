This folder contains 5 SQL files that transform raw data into the shape that I use for investigation.

For Effective and Readmission data, I noticed there are a portion of entries with "Not available" scores. For this exercise I decided to remove all these missing values in my analysis, due to a lack of the domain knowledge to come up with a good null-filling strategy.

I also noticed for "Emergency department volume" measure, it records the categorical instead of numeric values. I manually assigned a 1-4 scale score to this specific measure.

Readmission shows the percentage of patients that are readmissioned or died, therefore these measures are negatively correlated with hospital quality. In order to make it to be positively correlated, I calculated the difference from 1, which means the percentage patients that are not readmissioned and died.

For survey response data, I transformed 3 measures (Overall_Rating_of_Hospital_Achievement_Points, Overall_Rating_of_Hospital_Achievement_Points, Overall_Rating_of_Hospital_Improvement_Points) by taking out the number part before "out of 10" to make them numeric vaues.

  