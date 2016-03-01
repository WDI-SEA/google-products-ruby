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
backorder_count = 0

product_many_images = []

for i in (0...data.length) do
  # 1
  #if data[i]["kind"] === "shopping#product"
  #  kind_count += 1
  #end

  # 2
  #if data[i]["product"]["inventories"][0]["availability"].downcase === "backorder"
  #  backorder_count += 1
  #end

  # 3
  link_count = 0
  data[i]["product"]["images"].each do |image|
    if image.has_key?("link")
      link_count += 1
    end
  end
  if link_count > 1
      product_many_images << data[i]["product"]["title"]
  end

end

 

puts "Products with more than 1 image link: #{product_many_images}"
#puts "Total items with kind shopping#product: #{kind_count}"
#puts "Total number of items on backorder: #{backorder_count}"


