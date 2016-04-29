import sys
import psycopg2
import re

conn = psycopg2.connect(database="tcount", user="postgres",  host="localhost", port="5432")
cur = conn.cursor()
if len( sys.argv)==3 and int( sys.argv[1])<=int(sys.argv[2]):

    cur.execute("SELECT * from Tweetwordcount WHERE count between %i and %i order by count " %(int(sys.argv[1]),int(sys.argv[2])))
    pgsqlcount = cur.fetchall()
    print(pgsqlcount)
else:
    print('Please enter the correct range of occurrences!')
