#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)

data = google_data['items']
backorder = []
images = []
count = 0
canon_product = []
ebay_product = []

for i in (0...data.length) do
  if data[i]['kind'] === 'shopping#product'
    count+= 1
  end
  if data[i]['product']['inventories'][0]['availability'].downcase === 'backorder'
    backorder.push(i) 
  end
    if data[i]['product']['images'].length > 1 
    images.push(i) 
  end
  if data[i]['product']['brand'].downcase === 'canon'
    canon_product.push(i)
    if data[i]['product']['author']['name'].include?('eBay')
      ebay_product.push(i)
    end
  end
end

puts "There are #{count} items with kind of shopping product"
puts "There are #{backorder.length} items on backorder"
puts "There are #{images.length} items with more than one image"
puts "There are #{canon_product.length} canon items"
puts "There are #{ebay_product.length} ebay items"

for i in (0...data.length) do
  puts data[i]['product']['brand']
  puts data[i]['product']['inventories'][0]['price']
  puts data[i]['product']['images'][0]['link']
end

#outputs the full object
# puts google_data.inspect

#outputs the first item's title
# puts google_data["items"][0]["product"]["title"]