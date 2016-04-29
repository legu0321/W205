0.Set up Folders in EC2
mount -t ext4 /dev/xvdf /data
mkdir /data/project2
[Please copy git folder "W205-Ex2\Scripts\tweeetwordcount" to project2 folder ]


1.Set up Postgres SQL Database and table:
 
**scripts to run for one-time set up:

mount -t ext4 /dev/xvdf /data
mkdir /data/pgsql_ex2
mkdir /data/pgsql_ex2/data
mkdir /data/pgsql_ex2/logs
chown -R postgres /data/pgsql_ex2
su postgres
initdb -D /data/pgsql_ex2/data
exit

create user w205 WITH  PASSWORD 'postgres';
Create DATABASE tcount;
alter database tcount OWNER TO w205; 
grant all on database Tcount to w205;


psql -U postgres -d tcount

CREATE TABLE Tweetwordcount(
	word TEXT PRIMARY KEY     NOT NULL,
        count INT     NOT NULL
	   );


**recurring steps to run each time before launching the twitterwordcount application:


mount -t ext4 /dev/xvdf /data
cd /data
sudo -u postgres pg_ctl -D /data/pgsql_ex2/data -l /data/pgsql_ex2/logs/pgsql.log start



2.Running Streamprase

cd /data/project2/tweeetwordcount/
source /opt/py27environment/bin/activate
sparse run -n tweetwordcount



3.About wordcount.py

The scripts assume the existence of tcount table in the postgres DB. The word count stored in the table should be kept permenantly and at each run, the application add aaditional number of occurance for each word in the stream. If a word has never showed up in the steam before, the script will create a new entry for that word in the database.
   
The word count printed out onto the screen, is only a local count, showing the word occurance for the current application session.   


4.About finalresult.py

The script can be used to find the number of occurance for a specific or all words has ever been captured by the application. 

The script is set up to handle three cases:
1)print out the occurance for a DB known word
2)print out the text "Word XXX has not appeared" if application has never captured the word quried 
3)print out all the word count if no specific word is passed into the query 


5.About histogram.py
The script is used to qeury words that all the words that their total number of occurrences in the stream is between a certain range.

The scripts are set up to check the input argument and will print out error messages if any of the below checks are violated:
1)not exact 2 arguments are passed into the query
2)the second argument passed into the query is smaller than the first argument


6.About folder Key Codes
I took out some key scripts from the tweeetwordcount folder for grading purposes. It contains tweets.py, parse.py, wordcount.py, tweetwordcount.clj,histogram.py and finalresults.py.