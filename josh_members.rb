#Fetch Josh Members From the Site

require 'open-uri'
require 'nokogiri'
#require 'httparty'

url="http://www.joshsoftware.com/team"
josh_site=Nokogiri::HTML(open(url)) 

system ("clear")
=begin
x=response.index("content")+20
loop do
	print response[x]
	print "\n" if response[x]==','
	break if response[x]=='\''
	x=x+1
=end

josh_team=josh_site.css('div div h3').text
josh_team.split("\n\n").each {|member| print "#{member}\n"}

p "\n***********************************\n"

josh_team=josh_site.xpath('//div/div/h3').text #//means any where in the document and / means element of matching element
josh_team.split("\n\n").each {|member| print "#{member}\n"}

#using xpath
#josh_team=josh_site.xpath('//span')[0]

josh_team=josh_site.xpath('//span')

josh_team.length.times do |i|
	p josh_team[i].attr('title')	
end

