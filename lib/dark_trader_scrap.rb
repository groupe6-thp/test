require 'nokogiri'
require 'rubysl-open-uri'



#page1 = page.xpath('/html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr[1]/td[3]')
#puts page1.text
#/html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr[1]/td[5]/a
#/html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr[70]/td[5]/a
#/html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr[917]/td[5]/a


#yt = page.xpath('//a')
def take_symboles
	tipo = Array.new
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	ty = page.xpath('//td[3]')
	tipo<<ty.text
	tipo.each do |ema|
	end
	tipo
end
#page.xpath('//h1/a')


#all_emails_links = page.xpath('/html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr/td[3]')
##puts tt.join(' , ')
def take_price
	price = Array.new
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page_of_price = page.xpath ('//td[5]')
	price<<page_of_price.text
	price.each do |price_html|
	end
	price
end

def get_hash 
	array_output = Array.new
result = Hash.new
result[take_symboles] = take_price

result.length.times do |i,j| 
	result = {take_symboles[i] => take_price[j].strip[1..-1].to_f}
array_output << result
end
puts array_output
end
get_hash
