import tweepy

consumer_key = "gddHfQOEpv0Q5gLnvlHXAfXSz";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "JbxxGJEyRohUF6dRSZT75pCuShZL5ShjUuycWGLmR1xQi6nZkg";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "1564434217-MSv1ICGT4rlgpNzuoyh9eGt6YBpWkgk0gJpLH0G";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "gjEi0mkCg7a1k5mV9MDCtGLTYHgWMUOSyRtTvlJfcNRi6";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



