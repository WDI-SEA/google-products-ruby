# Ruby uses 'require' to load gems
require 'json'

# Ruby variables just require a name. No 'var'
current_directory = File.dirname(__FILE__)
file = File.read(current_directory + '/products.json')

# We use snake_case in Ruby. No camelCase.
google_data = JSON.parse(file)

# Use 'inspect' to see the contents of an array or hash
# Hashes are similar to objects in JavaScript
# puts google_data['items'].inspect

# Hashes require bracket syntax
# puts google_data['items'][0]['product']['title']

# Put your answers below here
# 1 The kind of results you're are dealing are shopping#products.
  # Go through the items and find all results that have kind of shopping#product.
  # How many are there? Where else is this count information stored in the search results?

count = 0
google_data['items'].each do
  if google_data['kind'] == 'shopping#products'
    count += 1
  end
end

puts count.inspect

  # ANSWER 1
  # There are 25 items.
  # This info is also stored int the JSON object as 'currentItemCount': 25,

# 2 Find all items with a backorder availability in inventories.

backorder_arr = []

google_data['items'].each do |item|
  item['product']['inventories'].each do |inventory|
    if inventory['availability'] == 'backorder'
      backorder_arr.push(item['product']['title'])
    end
  end
end

puts backorder_arr.inspect

# 3 Find all items with more than one image link.

multiple_images_arr = []

google_data['items'].each do |item|
  if item['product']['images'].length > 1
    multiple_images_arr.push(item['product']['title'])
  end
end

puts multiple_images_arr.inspect

# 4 Find all canon products in the items (careful with case sensitivity).

canon_arr = []

google_data['items'].each do |item|
  brand = item['product']['brand'].downcase
  if brand == 'canon'
    canon_arr.push(item['product']['title'])
  end
end

puts canon_arr.inspect

# 5 Find all items that have product author name of 'eBay' and are brand 'Canon'.

canon_ebay_arr = []

google_data['items'].each do |item|
  brand = item['product']['brand'].downcase
  author = item['product']['author']['name'].downcase
  if brand == 'canon' && author == 'ebay'
    obj = {}
    obj[:title] = item['product']['title']
    obj[:brand] = item['product']['brand']
    obj[:author] = item['product']['author']['name']
    canon_ebay_arr.push(obj)
  end
end

puts canon_ebay_arr.inspect

# 6 Print all the products with their brand, price, and a image link

product_arr = []

google_data['items'].each do |item|
  item['product']['inventories'].each do |inventory|
    obj = {}
    obj[:title] = item['product']['title']
    obj[:brand] = item['product']['brand']
    obj[:price] = inventory['price']
    obj[:image] = item['product']['images'][0]['link']
    product_arr.push(obj)
  end
end

puts product_arr.inspect
