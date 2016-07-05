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


# =========== 1

# c = 0
# google_data['items'].each do |item|
#   if item['kind'] == "shopping#product"
#     puts item['kind']
#     c+=1
#   end
# end
# puts c

# =========== 2

# c=0
# google_data['items'].each do |item|
#   begin
#     if item['product']['inventories'][0]['availability'] == "backorder"
#       puts "backorder"
#       c+=1
#     end
#   end
# end
# puts c

# =========== 3

# c=0
# google_data['items'].each do |item|
#   if item['product']['images'].count > 1
#     puts "yes"
#     c+=1
#   end
# end
# puts c

# =========== 4

# c=0
# google_data['items'].each do |item|
#   if item['product']['brand'] == "Canon"
#     puts "yes"
#     c+=1
#   end
# end
# puts c

# =========== 5

# c=0
# google_data['items'].each do |item|
#   if (item['product']['author']['name'] == "eBay") && (item['product']['brand'] == "Canon")
#     puts "yes"
#     c+=1
#   end
# end
# puts c

# =========== 6

google_data['items'].each do |item|
  puts item['product']['brand']
  puts item['product']['inventories'][0]['price']
  puts item['product']['images'][0]['link']
  puts ''
end
