

/**Q3**/
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



/**
AMI_7a  Fibrinolytic Therapy Received within 30 Minutes of Hospital Arrival     0.408248290463863     3
EDV     Emergency Department Volume     0.3641553211466038      3211
OP_2    Fibrinolytic Therapy Received Within 30 Minutes of ED Arrival   0.24723895613692826     68
STK_4   Thrombolytic Therapy    0.21954194561164012     874
OP_23   Head CT Scan Results for Acute Ischemic Stroke or Hemorrhagic Stroke Patients who Received Head CT or MRI Scan Interpretation Within 45 Minutes of ED Arrival  0.2184465349110375      959
CAC_3   Home Management Plan of Care (HMPC) Document Given to Patient/Caregiver 0.19271395612624423   96
VTE_5   Venous Thromboembolism Warfarin Therapy Discharge Instructions  0.1630300466996527      2468
OP_1    Median Time to Fibrinolysis     0.15435626606445746     68
VTE_1   Venous Thromboembolism Prophylaxis      0.15257401142298382     3534
OP_3b   Median Time to Transfer to Another Facility for Acute Coronary Intervention- Reporting Rate   0.14739663300525255      409

**/


/**
READM_30_AMI    Acute Myocardial Infarction (AMI) 30-Day Readmission Rate       0.14454441824168437     2302
READM_30_CABG   30-Day All-Cause Unplanned Readmission Following Coronary Artery Bypass Graft Surgery (CABG)    0.13827237206151444 1052
READM_30_PN     Pneumonia 30-Day Readmission Rate       0.12995039179383805     4227
MORT_30_PN      Pneumonia 30-Day Mortality Rate 0.12770023308807488     4212
READM_30_STK    Stroke (STK) 30-Day Readmission Rate    0.12688742932489383     2723
MORT_30_HF      Heart Failure (HF) 30-Day Mortality Rate        0.12644987174662428     3800
MORT_30_STK     Acute Ischemic Stroke (STK) 30-Day Mortality Rate       0.1213830669973097      2761
MORT_30_AMI     Acute Myocardial Infarction (AMI) 30-Day Mortality Rate 0.116835402637175       2506
READM_30_COPD   Chronic Obstructive Pulmonary Disease (COPD) 30-Day Readmission Rate    0.1152889075608961      3723
MORT_30_COPD    Chronic Obstructive Pulmonary Disease (COPD) 30-Day Mortality Rate      0.11468857365671271     3644


**/