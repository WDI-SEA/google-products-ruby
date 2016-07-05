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


count = 0
#1st
# google_data["items"].each do |item|
#   if item["kind"] == "shopping#product"
#     count += 1
#   end
# end

# puts count

#2nd

# google_data["items"].each do |item|
#   if item["product"]["inventories"][0]["availability"] == "backorder"
#     puts item
#   end
# end

#3rd

# google_data["items"].each do |item|
#   if item["product"]["images"].length > 1
#     puts item
#     count += 1
#   end
# end

# puts count

#4th

# google_data["items"].each do |item|
#   if item["product"]["brand"].downcase == "canon"
#     puts item
#     count += 1
#   end
# end

# puts count

#5th

# google_data["items"].each do |item|
#   if item["product"]["brand"].downcase == "canon" && item["product"]["author"]["name"] == "eBay"  
#     puts item
#     count += 1
#   end
# end

# puts count

#6th

# google_data["items"].each do |item|
#   puts item["product"]["brand"]
#   puts item["product"]["inventories"][0]["price"]
#   puts item["product"]["images"][0]
# end
