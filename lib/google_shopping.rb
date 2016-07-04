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

# 1. find all results that have 'kind' of 'shopping#product'
# 25 items with 'kind' of 'shopping#product'

# puts google_data['items'].count { |kind| 'shopping#product' }

# 2. Find all items with a backorder availability in inventories.
#prints product name

# for i in (0...google_data['items'].length) do
#   if google_data['items'][i]['product']['inventories'][0]['availability'] == 'backorder'
#     puts google_data['items'][i]['product']['title']
#   end
# end

# 3. Find all items with more than one image link.
# prints item name

# for i in (0...google_data['items'].length) do
#   if google_data['items'][i]['product']['images'].count > 1
#     puts google_data['items'][i]['product']['title']
#   end
# end

# 4. Find all canon products in the items (careful with case sensitivity).
#returns 7 canon brand items with or without .downcase

# for i in (0...google_data['items'].length) do
#   if google_data['items'][i]['product']['brand'].downcase == 'canon'
#     puts google_data['items'][i]['product']['title']
#   end
# end

#5. Find all items that have product author name of "eBay" and are brand "Canon".
#prints 4 total items

# for i in (0...google_data['items'].length) do
#   if (google_data['items'][i]['product']['brand'].downcase == 'canon') && (google_data['items'][i]['product']['author']['name'].include? 'eBay')
#     puts google_data['items'][i]['product']['title']
#   end
# end

# 6. Print all the products with their brand, price, and a image link
#prints all items with brand, price, and one image link

for i in (0... google_data['items'].length) do
  puts google_data['items'][i]['product']['brand']
  puts google_data['items'][i]['product']['inventories'][0]['price']
  puts google_data['items'][i]['product']['images'][0]
end

























