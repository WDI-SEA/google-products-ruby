require 'json'
file = File.read("./products.json")

google_data = JSON.parse(file)
#outputs the full object
#puts google_data.inspect
#outputs the first item's title
#puts google_data["items"][0]["product"]["title"]
data = google_data["items"]

#
kind_count = 0
backorder = []
product_many_images = []
canon_products = []

for i in (0...data.length) do
  # 1
  kind_count += 1 if data[i]["kind"] === "shopping#product"
  
  # 2
  backorder << data[i] if data[i]["product"]["inventories"][0]["availability"].downcase === "backorder"

  # 3
  link_count = 0
  data[i]["product"]["images"].each do |image|
    link_count += 1 if image.has_key?("link")
  end
  product_many_images << data[i]["product"]["title"] if link_count > 1
  
  #4
  canon_products << data[i] if data[i]["product"]["brand"].downcase === "canon"


end
#puts data[0]

puts "Total items with kind shopping#product: #{kind_count}"
puts "Total number of items on backorder: #{backorder.length}"
puts "Products with more than 1 image link: #{product_many_images.length}"
puts "Number of canon products: #{canon_products.length}"
