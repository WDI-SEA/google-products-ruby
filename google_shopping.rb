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

#outputs number of items that have a kind of "shopping#product"
 i = 0
 for i in (0...items.length)
   if items[i]['kind'] === 'shopping#product'
   shopping_products += 1
   end
 end
 
 #outputs products availbility that are 'backorder'
 items.each do |item|
   if item["product"]["inventories"][0]["availability"] ==='backorder'
     puts item["product"]["title"]
   end
 end
 
 items.each do |item|
   if item["product"]["images"][0]["link"].length > 1
     puts item["product"]["title"]
   end
 end

 
 #outputs all items that are Canon products regardless of case sensitivity
items.each do |item|
   if item["product"]["brand"].downcase === 'canon'
     puts item["product"]["title"]
   end
 end
 
 #outputs all items that are Canon products with an author name of eBay
 items.each do |item|
  if item["product"]["brand"].downcase === 'canon'
   if item["product"]["author"]["name"].downcase.include?("ebay")
       puts item["product"]["title"]
     end
   end
 end

 
 #outputs all prodcuts with Brand, Price and Image Link
items.each do |item|
     puts item["product"]["brand"]
     puts item["product"]["inventories"][0]["price"]
     puts item["product"]["images"][0]["link"]
 end
 +