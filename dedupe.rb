require 'csv'
require 'pp'

csv = CSV.read('links/links.csv').to_a

csv.uniq.each do |link|
  pp link[0] + ","
end

