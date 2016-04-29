from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
import re

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        # self.redis = StrictRedis()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount
        # Table name: Tweetwordcount
        # you need to create both the database and the table in advance.
        conn = psycopg2.connect(database="tcount", user="postgres",  host="localhost", port="5432")
        cur = conn.cursor()
        word=re.sub("'",'',word)
        word=word.lower()
        cur.execute("SELECT count from Tweetwordcount WHERE word='%s'" %(word))
        pgsqlcount = cur.fetchone()
        if not  pgsqlcount:
            #insert
            # cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES ("+word+", 1)");
            cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES ('%s', 1)" %(word));
            conn.commit()
        else:
            #update
            #cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word='%s'" %(self.counts[word]+pgsqlcount[0],word))
			cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word='%s'" %(1+pgsqlcount[0],word))
            conn.commit()

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
