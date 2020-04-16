require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def president
materials_www = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
array_crypto = []
hash_crypto = Hash.new

scrap = materials_www.xpath('//tr[*]').each do |temp_mat|
key = temp_mat.xpath('td[3]').text
value = temp_mat.xpath('td[5]').text.gsub(/[,$]/, "").to_f
if key != ""
	hash_crypto = {key => value}
	array_crypto << hash_crypto

end
end
return puts array_crypto
end

president





#puts page.class   # => Nokogiri::HTML::Document
# xpath BTC
# /html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/a[2]
# <a href="/currencies/bitcoin/markets/" class="cmc-link">$6&nbsp;897,42</a>






# all_emails_links = page.xpath('/mettre_ici_le_XPath')

# pour recup les liens d'une page == page.xpath('//a')
# pour recup les liens du h1 == page.xpath('//h1')
# recup les liens sous le h1 == page.xpath('//h1//a')
# recup directement les liens sous h1 == page.xpath('//h1/a') 
# tous les elements sous le h1 == page.xpath('//h1/*')

# recup le lien d'id email situe sous un titre h1 de classe primary 
# == page.xpath('//h1[@class="primary"]/a[@id="email"]')
# le truc dans le truc dans le truc h1 classe primary

# Si tu veux récupérer tous les liens dont le href contient le mot "mailto", 
# == page.xpath('//a[contains(@href, "mailto")]')

# Ensuite, tu veux récupérer le texte de chaque lien ? 
# Il faut parcourir l'array et extraire le .text de chaque élément HTML

# all_emails_links.each do |email_link|
#       puts email_link.text #ou n'importe quelle autre opération de ton choix ;)
#       end

#récupérer le texte du href d'un élément HTML == email_link['href']

