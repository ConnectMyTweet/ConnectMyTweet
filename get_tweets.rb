#!/usr/bin/ruby

print "Getting your latest Tweets\n"

require "twitter"

# keys are here https://apps.twitter.com/app/5179915/keys

Twitter.configure do |config|
  config.consumer_key = "n2t7jEoDh4299r?????????"
  config.consumer_secret = "t0LfrEqNkmCnnqiRqHXy16FjzHZB8Pg????????????"
  config.oauth_token = "101337285-83AJvz3RVsPKxH1C7LQul99zjCql??????????"
  config.oauth_token_secret = "jfrQ6y3pHOLQTd5gYpV1bhS0jYM75H????????????"
end

print Twitter.home_timeline

print "DONE - Getting your Tweets\n"
