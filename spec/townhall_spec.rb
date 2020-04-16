require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

target_url = "https://www.annuaire-des-mairies.com/val-d-oise.html"



def get_townhall_email(adress_source)
  town_page = Nokogiri::HTML(open(adress_source))
  town_name = town_page.xpath('//section[@class="text-center well well-sm"]//h1')
  emails = town_page.xpath('//section[2]//tr[4]/td[2]') 
  return mailto = {town_name.text => emails.text}
end

def get_townhall_urls(target_url)
	list_url = []
	final = []

  page = Nokogiri::HTML(open(target_url))
	town_link = page.xpath('//a[@class="lientxt"]/@href')
	town_link.each do |href|
		list_url << "https://www.annuaire-des-mairies.com/" + href.text.gsub("./", "")
	end
	
	list_url.each do |url|
		final << get_townhall_email(url)
	end
	
	return final
end

puts get_townhall_urls(target_url)


