require "rubygems"
require "nokogiri"
require 'rubysl-open-uri'
require "pry"








## méthode qui récupère les noms de mairie toute la ville de val d'oise
def get_townhall_list
	array_for_list_townhall = []
	townhall_page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	townhall_page.xpath('//a[@class="lienttxt"]').each do |names|
		array_for_list_townhall << names.text
	end
	return array_for_list_townhall
end

## méthode qui récupéure les url de chaque ville du val'oise'
def get_townhall_urls
	array_for_links = []
	val_d_oise_page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	val_d_oise_page.xpath('//a[@class="lientxt"]').each do |links|
		#binding.pry
		add = "https://www.annuaire-des-mairies.com" + links['href'].slice!(1,18)
		array_for_links << add
	end
	return array_for_links	
end
#binding.pry

##méthode qui récupére l'email d'une mairie à partir de l'url de mairies, ex celle de Avernes.

def get_townhall_email
	emails_array = []
	complete_urls = get_townhall_urls
	#binding.pry
	#add = "https://www.annuaire-des-mairies.com" + link
	complete_urls.length.times do |i| 
		emails_page_of_one_mairie = Nokogiri::HTML(open(complete_urls[i])) 
		emails_mairies = emails_page_of_one_mairie.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text	
		emails_array << emails_mairies
	end
	return emails_array
end

#méthode qui rassemble dans un tableau les emails pour chaque mairie de Val d' oise 
def final_array
	table_result = []
	key = get_townhall_list
	value = get_townhall_email
	key.length.times do |k| 
		table << { value[k] => key[k]}
	end
	return table_result
end
puts final_array