#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)


#outputs the full object
puts google_data.inspect

#outputs the first item's title
puts google_data["items"][0]["product"]["title"]



#counts the number of shopping#products also in currentItemCount
count1 = 0
google_data["items"].each do |item|
	if item["kind"] == ('shopping#product')
		count1+=1
	end
end
puts "number of shopping\#products is #{count1}"

#finds all items with backorder avaliability

google_data["items"].each do |item|

	if item["product"]["inventories"][0]["availability"] == ("backorder")
		puts item["product"]["title"]+" has a backorder"
	end
end

#finds all items with more than one image link
google_data["items"].each do |item|
	if item["product"]["images"].length > 1
		puts item["product"]["title"]+" has more than one image link"
	end
end

#finds all canon products
google_data["items"].each do |item|
	if (item["product"]["brand"].downcase) == ("canon")
		puts item["product"]["title"]+" is a canon"
	end
end

#finds ebay and canon products
google_data["items"].each do |item|
	if (item["product"]["brand"].downcase) == ("canon")
		if (item["product"]["author"]["name"].downcase).include? "ebay"
			puts item["product"]["title"]+" is both ebay and canon"
		end
	end
end

#prints brand price and img link
google_data["items"].each do |item|
	puts item["product"]["title"]+" is a "+ item["product"]["brand"]+" that costs $#{item["product"]["inventories"][0]["price"]}"+" and has a img link at "+item["product"]["images"][0]["link"]


end


#+" that costs $"+item["product"]["inventories"][0]["price"]+" and has a img link at "+item["product"]["images"][0]

