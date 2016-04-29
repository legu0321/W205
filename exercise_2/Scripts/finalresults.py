import sys
import psycopg2
import re

conn = psycopg2.connect(database="tcount", user="postgres",  host="localhost", port="5432")
cur = conn.cursor()
if len( sys.argv)>1:
    word = sys.argv[1]
    word=re.sub("'",'',word.lower())
    cur.execute("SELECT count from Tweetwordcount WHERE word='%s'" %(word))
    pgsqlcount = cur.fetchone()
    if pgsqlcount:
        print('Total number of occurrences of "%s": %i' %(word,pgsqlcount[0]))
    else:
        print('Word "%s" has not appeared' %word)
else:
    cur.execute("SELECT * from Tweetwordcount order by word")
    pgsqlcount = cur.fetchall()
    print(pgsqlcount)
