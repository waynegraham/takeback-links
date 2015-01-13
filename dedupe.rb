require 'csv'
require 'pp'

csv = CSV.read('links/links.csv').to_a.uniq
pp "url,notes"
csv.each do |link|
  pp link[0]
end

