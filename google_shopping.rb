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

#1.) The kind of results you're are dealing are shopping#products. 
#Go through the items and find all results that have kind of shopping#product. 
#How many are there? Where else is this count information stored in the search results?

=begin

x=0
google_data['items'].each do |item| 
  if item["kind"] == "shopping#product"
    x += 1
  end
end 
puts x

=end
#ANSWER:  x=25 items
#this is also currentItemCount at top of page

#2.) Find all items with a backorder availability in inventories.

=begin

backorder_items = []

google_data['items'].each do |item|
  if item['product']['inventories'][0]['availability'] == "backorder"
    backorder_items.push(item['product']['title'])
  end
end

puts backorder_items

=end
#ANSWER: 2 items

#3.) Find all items with more than one image link.

=begin 

google_data['items'].each do |item|
  if item['product']['images'].length > 1
    puts item['product']['title']
  end
end

=end
#ANSWER: 6 items

#4.) Find all canon products in the items (careful with case sensitivity).

=begin

google_data['items'].each do |item|
  if item['product']['brand'].downcase == "canon"
    puts item['product']['title']
  end
end

=end
#ANSWER: 7 items

#5.) Find all items that have product author name of "eBay" and are brand "Canon".

=begin

google_data['items'].each do |item|
  if (item['product']['brand'].downcase == "canon") && (item['product']['author']['name'].downcase.split(" ").index("ebay") != nil)
    puts item['product']['author']['name']+" --- "+item['product']['title']
  end
end

=end
#ANSWER: 4 items

#6.) Print all the products with their brand, price, and a image link

=begin

google_data['items'].each do |item| 
  puts "BRAND: "+item['product']['brand']
  puts "PRICE: "+item['product']['inventories'][0]['price'].to_s
  puts "IMAGE: "+item['product']['images'][0]['link']
  puts " "
end 

=end