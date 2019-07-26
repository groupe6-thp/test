require "rubygems"
require "nokogiri"
require 'rubysl-open-uri'
require "pry"

$list_meps_page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576"))

#méthode qui récupère tous les noms et prenoms des députés en France
def gets_list_names_of_meps
names_lastnames_array = []
$list_meps_page.xpath("/html/body/div[1]/main/div/div/div[1]/ul/li[1]/h2").each do |name_lastname|
	opera = name_lastname.text.split
	unit_names_lastnames = "nom => #{opera[2]}\n prenoms => #{opera[1]}" 
	names_lastnames_array << unit_names_lastnames
	end
return names_lastnames_array
end

#méthode qui récupère tosu les emails des députés en France
def get_list_emails_of_meps
emails_array = []
	$list_meps_page.xpath("/html/body/div[1]/main/div/div/div[1]/ul/li[5]/a").each do |mails| 
	emails_array << mails.text
	end
	return emails_array
end


def final_result
	table_result = []
	key = gets_list_names_of_meps
	value = get_list_emails_of_meps
	value.length.times do |k| 
		table_result << { "emails" => value[k]}
		#table_result << key [k]
	end
	return table_result
end
puts final_result