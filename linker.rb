require 'csv'
require 'pp'
require 'url_expander'

TWEET = "@konedriver: Did #UVA rapist exist? 
http://t.co/fLyJ5cyV49 http://t.co/qjw9hFymuN 

No-there are no rapists at #UVA
No one ever expelled !"

links = []

def find_links
  regex = %r{http[s]?:\/\/(.+)}i
  tweets = regex.match(TWEET)

  collection = tweets[0].split(' ')

  collection.each do |link|
    pp UrlExpander::Client.expand(link)
  end
end

find_links
