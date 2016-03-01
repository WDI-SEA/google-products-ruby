#RUBY!! no more semi-colons... ever.

require 'json'

file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)


# #outputs the full object
# puts google_data.inspect

# #outputs the first item's title
# puts google_data["items"][0]["product"]["title"]

#how many items are in the json file

puts "How many items in this file :"
puts google_data["items"].length 

#find all items with inventory backorder

puts "Availability backorder: "
google_data["items"].map  do |item|
	if item["product"]["inventories"][0]["availability"] == "backorder"
		puts item["product"]["title"]
	end 
end 

#Find all items with more than one image link.

puts "More than one image link: "
google_data["items"].map  do |item|
	if item["product"]["images"].length > 1
		puts item["product"]["title"]
	end 
end 

#Find all `canon` products in the items (careful with case sensitivity).

puts "All canon products: "
google_data["items"].map  do |item|
	if item["product"]["brand"].downcase == "canon"
		puts item["product"]["title"]
	end 
end 

#Find all `items` that have **product** **author** **name** of "eBay" and are brand "Canon".

puts "All canon products: "
google_data["items"].map  do |item|
	if item["product"]["author"]["name"] == "eBay" && item["product"]["brand"] == "Canon"
		puts item["product"]["title"]
	end 
end 


#Print all the products with their **brand**, **price**, and a **image link**

puts "All products: "
google_data["items"].map  do |item|
		puts item["product"]["brand"]
		puts item["product"]["inventories"][0]["price"] 
		puts item["product"]["images"][0]["link"]
end 
