#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)


#outputs the full object
#puts google_data.inspect

#outputs the first item's title
#puts google_data["items"][0]["product"]["title"]


# 1.) The kind of results you're are dealing are shopping#products. Go through the items and find all results that have kind of shopping#product. How many are there? Where else is this count information stored in the search results?

counter = 0
google_data["items"].each do |item|
 if item["kind"] == 'shopping#product'
 	counter = counter + 1
 end
end
puts counter

# 2.) Find all items with a backorder availability in inventories.

 backorder = []
 google_data["items"].each do |item|
	if item["product"]["inventories"][0]["availability"] == "backorder"
		backorder << item["product"]["title"]
	end
end
puts backorder

#3.) Find all items with more than one image link.

images = []
google_data["items"].each do |item|
	if item["product"]["images"].length > 1
		images << item
	end
end
puts images.length

#4.) Find all canon products in the items (careful with case sensitivity).

canon_products = []
google_data["items"].each do |item|
	if item["product"]["brand"].downcase == "canon"
		canon_products << item
	end
end
puts canon_products.length

#5.) Find all items that have product author name of "eBay" and are brand "Canon".

ebay_and_canon = []
google_data["items"].each do |item|
	if item["product"]["brand"].downcase == "canon" && item["product"]["author"]["name"].downcase.include?("ebay")
		ebay_and_canon << item
	end
end
puts ebay_and_canon.length

#6.) Print all the products with their brand, price, and a image link

google_data["items"].each do |item|
	puts item["product"]["brand"]
	puts item["product"]["inventories"][0]["price"]
	puts item["product"]["images"][0]["link"]
	puts "----------------------"
end

 

