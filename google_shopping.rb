#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)
data = google_data["items"]

#outputs the full object
# puts google_data.inspect

#outputs the first item's title
# puts google_data["items"][0]["product"]["title"]

#outputs total number of items with kind of shopping#product
count = 0
data.each do |item|
	if item["kind"] == "shopping#product"
	count += 1
	end
end
puts "Total number of items with kind of shopping#product: #{count}"

#outputs all items with a backorder availability in inventories
count = 0
data.each do |item|
	if item["product"]["inventories"][0]["availability"] == "backorder"
		count += 1
	end
end
puts "Total number of items in inventory with backorder availability: #{count}"

#outputs total number of items with more than one image link
count = 0
data.each do |item|
	if item["product"]["images"].length > 1
		count += 1
	end
end
puts "Total items with more than one image link: #{count}"

#outputs all canon products
count = 0
data.each do |item|
	if item["product"]["brand"] == "Canon"
		count += 1
	end
end
puts "Total number of Canon products: #{count}"

#outputs all items with product author name of eBay and brand Canon
count = 0
data.each do |item|
	if item["product"]["brand"] == "Canon" and item["product"]["author"]["name"].include?'eBay'
		count += 1
	end
end
puts "Total number of Canon products with author name eBay: #{count}"

#outputs all products and their brand, price, and image link
data.each do |item|
	puts "----------------------"
	puts item["product"]["brand"]
	puts item["product"]["inventories"][0]["price"]
	puts item["product"]["images"][0]["link"]
end