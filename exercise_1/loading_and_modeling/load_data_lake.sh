mount -t ext4 /dev/xvdf /data
/root/start-hadoop.sh
/data/start_postgres.sh
su - w205
hdfs dfs -mkdir /user/w205/hospital_compare

hdfs dfs -mkdir /user/w205/hospital_compare/hospital
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmission
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_response


wget -O "Hospital_Revised_Flatfiles.zip" https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip


unzip Hospital_Revised_Flatfiles.zip -d data_file

tail -n+2 data_file/"Hospital General Information.csv" > data_file/"hospital.csv"
tail -n+2 data_file/"Timely and Effective Care - Hospital.csv" > data_file/"effective_care.csv"
tail -n+2 data_file/"Readmissions and Deaths - Hospital.csv" > data_file/"readmissions.csv"
tail -n+2 data_file/"Measure Dates.csv" >data_file/"measures.csv"
tail -n+2 data_file/"hvbp_hcahps_05_28_2015.csv" > data_file/"surveys_response.csv"



hdfs dfs -put data_file/"hospital.csv" /user/w205/hospital_compare/hospital
hdfs dfs -put data_file/"effective_care.csv" /user/w205/hospital_compare/effective_care
hdfs dfs -put data_file/"readmissions.csv" /user/w205/hospital_compare/readmission
hdfs dfs -put data_file/"measures.csv" /user/w205/hospital_compare/measures
hdfs dfs -put data_file/"surveys_response.csv" /user/w205/hospital_compare/surveys_response

