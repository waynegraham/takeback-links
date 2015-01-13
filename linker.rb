require 'csv'
require 'pp'
require 'url_expander'

OUTPUT_DIR = 'links'
INPUT_DIR  = 'data'

def find_links(tweet)
  regex = %r{http[s]?:\/\/(.+)}i
  #regex = %r'(http://t\.co(/[\w/]+))'
  tweets = regex.match(tweet)

  collection = tweets.to_a

  unless collection.first.nil?
    collection.each do |link|
      begin
        pp UrlExpander::Client.expand(link)
      rescue
      end
    end
  end
end

Dir.glob("#{INPUT_DIR}/*.csv").each do |file|
  CSV.foreach(file) do |row|
    find_links(row[3])
  end
end


