#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)


#outputs the full object
#puts google_data.inspect

#outputs the first item's title
puts google_data["items"][0]["product"]["title"]


puts "********** question one **********"

google_data["items"].each do |item|
	puts item["kind"]
end

shopping_products = []
google_data["items"].each do |item|
	if item["kind"] == "shopping#product" 
		shopping_products << item["kind"]
	end
end

puts shopping_products.length

puts "********** question two **********"

shopping_inventories = []
google_data["items"].each do |item|
	item["product"]["inventories"].each do |inventory|
		if inventory["availability"] == "backorder"
			shopping_inventories << item
		end
	end
end

puts shopping_inventories.length
#puts shopping_inventories (how you call the actual item, but it is not pretty)

puts "********** question three **********"

shopping_images = []
google_data["items"].each do |item|
	links = 0
	item["product"]["images"].each do |image|
		if image.has_key?("link") 
			links += 1
		end
	end
		if links > 1
			shopping_images << item 
	end
end

puts shopping_images.count

puts "********** question four **********"

canon_inventories = []
	google_data["items"].each do |item|
		if item["product"]["brand"] == "Canon"
			canon_inventories << item
			end 
		end 
puts canon_inventories

puts "********** question five **********"

ebay_canon_array = []
	google_data["items"].each do |item|
		if item["product"]["brand"] == "Canon" && item["product"]["author"]["name"] == "eBay"
			ebay_canon_array << item
		end
	end
puts ebay_canon_array

puts "********** question six **********"

google_data["items"].each do |item|
	puts item["product"]["brand"] 
end


google_data["items"].each do |item|
	item["product"]["inventories"].each do |inventory|
	puts inventory["price"]
	end
end

google_data["items"].each do |item|
	item ["product"]["images"].each do |images|
		puts images["link"]
	end
end
















