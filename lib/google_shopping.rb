# Ruby uses 'require' to load gems
require 'json'

# Ruby variables just require a name. No 'var'
current_directory = File.dirname(__FILE__)
file = File.read(current_directory + '/products.json')

# We use snake_case in Ruby. No camelCase.
google_data = JSON.parse(file)

# Use 'inspect' to see the contents of an array or hash
# Hashes are similar to objects in JavaScript

puts 'Dont forget about the hash!!!'
#puts google_data.inspect

# Hashes require bracket syntax
 # puts google_data['items'][0]['product']
# Put your answers below here

# 1
for i in (0...google_data['items'].length) do
  if google_data['items'][i]['kind'] == 'shopping#product'
    puts google_data['items'][i]['kind']
  end
end

# 2
for i in (0...google_data['items'].length) do
  if google_data['items'][i]['product']['inventories'][0]['availability'] == 'backorder'
    puts google_data['items'][i]['product']['inventories'][0]['availability']
  end
end

# 3
for i in (0...google_data['items'].length) do
  if google_data['items'][i]['product']['images'].length > 1
    puts google_data['items'][i]
  end
end

#4
for i in (0...google_data['items'].length) do
  brandName = 'Canon'
  if google_data['items'][i]['product']['brand'] == brandName
    puts google_data['items'][i]['product']['brand']
  end
end

#5
for i in (0...google_data['items'].length) do
  if google_data['items'][i]['product']['author']['name'] === 'eBay' && google_data['items'][i]['product']['brand'] === 'Canon'
    puts google_data['items'][i]['product']['title']
  end
end

#6
for i in (0...google_data['items'].length) do
  puts google_data['items'][i]['product']['brand']
  puts google_data['items'][i]['product']['inventories'][0]['price']
  puts google_data['items'][i]['product']['images']
end

