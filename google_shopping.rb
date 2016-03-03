#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)
items = google_data["items"]
shopping_products = 0


#outputs the full object
#puts google_data.inspect

#outputs the first item's title
#puts google_data["items"][0]["product"]["title"]

#outputs number of items that have a kind of "shopping#product"
i = 0
for i in (0...items.length)
  if items[i]['kind'] === 'shopping#product'
  shopping_products += 1
  end
end
puts '*************************'
puts 'Total number of items that are shopping products: '
puts shopping_products
puts 'This information is also stored in the "currentItemCount field'
puts '*************************'

#outputs items that have an avilability of backorder
puts 'Items on backorder status:'
puts '*************************'
items.each do |item|
  if item["product"]["inventories"][0]["availability"] ==='backorder'
    puts item["product"]["title"]
  end
end
puts '*************************'

#outputs all items with more than one image link
puts 'Items with more than one image link:'
puts '*************************'
items.each do |item|
  if item["product"]["images"][0]["link"].length > 1
    puts item["product"]["title"]
  end
end
puts '*************************'

#outputs all items that are Canon products regardless of case sensitivity
puts 'Canon Products:'
puts '*************************'
items.each do |item|
  if item["product"]["brand"].downcase === 'canon'
    puts item["product"]["title"]
  end
end

#outputs all items that are Canon products with an author name of eBay
puts '*************************'
puts 'Canon Products with Product Author Name of eBay:'
puts '*************************'
items.each do |item|
  if item["product"]["brand"].downcase === 'canon'
    if item["product"]["author"]["name"].downcase.include?("ebay")
      puts item["product"]["title"]
    end
  end
end
puts '*************************'

#outputs all prodcuts with Brand, Price and Image Link
puts '*************************'
puts 'All Products:'
puts '*************************'
items.each do |item|
    puts item["product"]["brand"]
    puts item["product"]["inventories"][0]["price"]
    puts item["product"]["images"][0]["link"]
end




