#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")


#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)
data = google_data["items"]
backorder = []


# outputs the full object
#puts google_data.inspect

# outputs the first item's title
#puts google_data["items"][0]["product"]["title"]

#counts items
#puts data.length

count = 0
data.each do |item|
	if item["kind"] == "shopping#product"
	count += 1
	end
end
puts ("There are #{count} shopping#product items.")

# items with backorder status
countbackorder = 0
data.each do |item|
	if item["product"]["inventories"][0]["availability"] == ("backorder")
		#print item
		countbackorder += 1
	end
	
end
puts ("There are #{countbackorder} backordered items.")

#count where there is more than one image link
imagecount = 0
data.each do |item|
	if item["product"]["images"].length > 1
		imagecount += 1
	end
end
puts ("There are #{imagecount} items with more than one image link.")

canoncount = 0
data.each do |item|
	if item["product"]["brand"].downcase == ("canon").downcase
		canoncount += 1
	end
end
puts ("There are #{canoncount} items that are Canon brand.")

ebaycanoncount = 0
data.each do |item|
	if item["product"]["author"]["name"].downcase.include? ("ebay").downcase and item["product"]["brand"].downcase == ("canon").downcase
		ebaycanoncount += 1
	end
end
puts ("There are #{ebaycanoncount} items with an ebay author and Canon brand.")




data.each do |item|
	brand = item["product"]["brand"]
	price = item["product"]["inventories"][0]["price"]
	image = item["product"]["images"][0]

	puts("Item brand: #{brand}, price: #{price}, image link: #{image}")
end











