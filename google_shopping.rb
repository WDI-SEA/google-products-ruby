#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)


#outputs the full object
# puts google_data.inspect

#outputs the first item's title
# puts google_data["items"][0]["product"]["title"]

# outputs the number of objects
puts "Total number of items..."
puts google_data["items"].length
puts ""

things = google_data["items"]
canon = []

# outputs all items on backorder
puts "Items on backorder..."
things.each do |item|
  if item["product"]["inventories"][0]["availability"] == "backorder"
    puts item["product"]["title"]
  end
end
puts ""

# outputs all items with more than one image link
puts "Items with more than one image link..."
for item in things do
  if item["product"]["images"].length > 1
    puts item["product"]["title"]
  end
end
puts ""

# outputs all items that are Canon products
puts "Items that are Canon products..."
things.each do |item|
  if item["product"]["brand"].downcase == "canon"
    canon.push(item)
    puts item["product"]["title"]
  end
end
puts ""

# outputs all Canon products with author name eBay
puts "Canon products on eBay..."
canon.each do |item|
  if item["product"]["author"]["name"].index("eBay")
    puts item["product"]["title"]
  end
end

# outputs all items with brand, price and image link
puts "All items"
for item in things do
  puts item["product"]["title"]
  puts "Brand: " + item["product"]["brand"] + " Price: " + item["product"]["inventories"][0]["price"].to_s
  puts item["product"]["images"][0]["link"]
  puts ""
end