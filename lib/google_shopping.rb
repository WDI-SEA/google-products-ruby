# Ruby uses 'require' to load gems
require 'json'

# Ruby variables just require a name. No 'var'
current_directory = File.dirname(__FILE__)
file = File.read(current_directory + '/products.json')

# We use snake_case in Ruby. No camelCase.
google_data = JSON.parse(file)

# Use 'inspect' to see the contents of an array or hash
# Hashes are similar to objects in JavaScript

puts google_data.inspect

# Hashes require bracket syntax
# puts google_data['items'][0]['product']['title']

# Put your answers below here

# 1.) The kind of results you're are dealing are shopping#products. Go through
# the items and find all results that have kind of shopping#product.
# How many are there? Where else is this count information stored in the search
# results?

arr = []
google_data['items'].each do |item|
  if item['kind'] == 'shopping#product'
    arr.push(item)
  end
  puts arr
end
puts arr.length

# "currentItemCount": 25

# 2.) Find all items with a backorder availability in inventories.

arr_backorder = []
google_data['items'].each do |item|
  item['product']['inventories'].each do |inventory|
    if inventory['availability'] == 'backorder'
      arr_backorder.push(item)
    end
  end
  puts arr_backorder
end

# 3.) Find all items with more than one image link.

arr_images = []
google_data['items'].each do |item|
  if item['product']['images'].length > 1
    arr_images.push(item)
  end
end
puts arr_images
puts arr_images.length

# 4.) Find all canon products in the items (careful with case sensitivity).
arr_canon = []
google_data['items'].each do |item|
  if item['product']['brand'] == 'Canon'
    arr_canon.push(item)
  end
end
puts arr_canon
puts arr_canon.length


# 5.) Find all items that have product author name of "eBay" and are brand "Canon".
arr_ebay_canon = []
google_data['items'].each do |item|
  if item['product']['author']['name'] == 'eBay' && item['product']['brand'] == 'Canon'
    arr_ebay_canon.push(item)
  end
end
puts arr_ebay_canon
puts arr_ebay_canon.length

# 6.) Print all the products with their brand, price, and a image link
google_data['items'].each do |item|
  puts google_data['items'].index(item)
  puts item['product']['brand']
  item['product']['inventories'].each do |inventory|
    puts inventory['price']
  end
  puts item['product']['images'].first
end
