#! /usr/bin/env ruby

require 'csv'
require 'uri'

black_list = %(
http://sbnation.com
http://www.sbnation.com
http://virginia.247sports.com
http://247sports.com
http://twitter.com/TheUVAFool/
http://twitter.com/UVAMenSoccer/
http://watch.scout.com/
http://www.dailyprogress.com/cavalierinsider/
http://www.dukebasketballreport.com
http://www.dailypress.com/sports/
http://espn.go.com/
http://www.hoopseen.com/
http://straighthoops.com/
http://twitter.com/DP_Sports/
http://wahoowa.net/
http://wahoobasketball.podbean.com/
http://twitter.com/UVA_Recreation/
http://wp.me/
http://theusports.com/
http://twitter.com/PilotSportsNow/
http://www.richmond.com/sports/
http://twitter.com/themillieneal/
http://www.healthsystem.virginia.edu/
http://recsports.virginia.edu/
http://www.catchajob.us/job/
http://twitter.com/TheUVAFool/
http://twitter.com/UVAMensHoops/
http://www.richmond.com/sports/
http://mbd.scout.com/
http://twitter.com/PostSports/
http://scores.espn.go.com/
http://www.hokiesports.com/
http://twitter.com/VirginiaRowing/
http://www.hudl.com/athlete/
http://dailypress.feedsportal.com/
http://www.roanoke.com/sports/
http://www.cityleaguehoops.net/
).split(/\n/).reject(&:empty?)

filtered = Array.new

CSV.parse(File.open('unique.csv')).collect do |item|

  begin
    url = URI.encode(item[0])
    uri = URI(url)
    unless black_list.include? "http://#{uri.host}"
      filtered << item[0]
    end
  end
end

puts filtered
