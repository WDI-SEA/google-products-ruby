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

# NOTES

# Hashes require bracket syntax

# Put your answers below here

# 1

# results = google_data['items'].select do |element|
#   element['kind'] == 'shopping#product'
# end

# puts results.inspect

# puts results.length

# 2
# results = google_data['items'].select do |element|
#   element['product']['inventories'][0]['availability'] == 'backorder'
# end

# puts results.inspect

# puts results.length

# 3
# results =  google_data['items'].select do |element|
#   element['product']['images'].length > 1
# end

# puts results.length

# 4
# results =  google_data['items'].select do |element|
#   element['product']['brand'] == 'Canon'
# end

# puts results.length

# 5
# results =  google_data['items'].select do |element|
#   element['product']['author']['name'] == 'eBay'
# end

# puts results.inspect

# puts results.length

# 6
google_data['items'].each do |element|
  puts element['product']['brand']
  puts element['product']['inventories'][0]['price']
  puts element['product']['images'][0]['link']
end
