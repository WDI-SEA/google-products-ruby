require 'json'
file = File.read("./products.json")

google_data = JSON.parse(file)
#puts google_data.inspect #outputs the full object
#puts google_data["items"][0]["product"]["title"] #outputs the first item's title
data = google_data["items"]

kind_count = 0
backorder_items = []
product_many_images = []
canon_products = []
ebay_canon_products =[]

for i in (0...data.length) do
  data_product = data[i]["product"]
  # 1
  kind_count += 1 if data[i]["kind"] === "shopping#product"
  # 2
  backorder_items << data[i] if data_product["inventories"][0]["availability"].downcase === "backorder"
  # 3
  link_count = 0
  data_product["images"].each do |image|
    link_count += 1 if image.has_key?("link")
  end
  product_many_images << data_product["title"] if link_count > 1
  # 4
  canon_products << data[i] if data_product["brand"].downcase === "canon"
  # 5
  ebay_canon_products << data[i] if data_product["author"]["name"].downcase === "ebay" && data_product["brand"].downcase === "canon"
  # 6
  puts data_product["brand"]
  puts data_product["inventories"][0]["price"]
  puts data_product["link"]
  puts " "
end

puts "Total items with kind shopping#product: #{kind_count}"
puts "Total number of items on backorder: #{backorder_items.length}"
puts "Products with more than 1 image link: #{product_many_images.length}"
puts "Number of canon products: #{canon_products.length}"
puts "Number of Canon products sold by eBay: #{ebay_canon_products.length}"
