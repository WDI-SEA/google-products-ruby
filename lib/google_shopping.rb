# Ruby uses 'require' to load gems
require 'json'

# Ruby variables just require a name. No 'var'
current_directory = File.dirname(__FILE__)
file = File.read(current_directory + '/products.json')

# We use snake_case in Ruby. No camelCase.
google_data = JSON.parse(file)

# Use 'inspect' to see the contents of an array or hash
# Hashes are similar to objects in JavaScript
# puts google_data.inspect

# Hashes require bracket syntax
# puts google_data['items'][0]['product']['title']

# Put your answers below here



# 1. Find all results that have the value shopping#product for the key "kind". And then find the count
# counter = 0

# google_data['items'].each do |item|
#   # puts item['kind']
#   if item['kind'] == 'shopping#product'
#     puts item['product']['title']
#   counter += 1
#   end
# end

# puts counter


# 2. Find all items with a `backorder` availability in `inventories`.
# google_data['items'].each do |item|
#   if item['product']['inventories'][0]['availability'] == 'backorder'
#     puts item['product']['title']
#   end
# end


# 3. Find all items with more than one image link.
# google_data['items'].each do |item|
#   if item['product']['images'].length > 1
#     puts item['product']['title']
#   end
# end


# 4. Find all `canon` products in the items (careful with case sensitivity).

# google_data['items'].each do |item|
#   if item['product']['title'].downcase.include? "canon"
#     puts item['product']['title']
#   end
# end


# 5. Find all `items` that have **product** **author** **name** of "eBay" and are brand "Canon".

# google_data['items'].each do |item|
#   if (item['product']['author']['name'].include? "eBay") && (item['product']['brand'].downcase == "canon")
#     puts item['product']['title']
#   end
# end

# 6. Print all the products with their **brand**, **price**, and a **image link**

# google_data['items'].each do |item|
#     puts item['product']['brand']
#     puts item['product']['inventories'][0]['price']
#     puts item['product']['images'][0]['link']
# end

