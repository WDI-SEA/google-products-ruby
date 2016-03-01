#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)


# #outputs the full object
# puts google_data.inspect

# #outputs the first item's title
# puts google_data["items"][0]["product"]["title"]

# Number 1, The kind of results you're are dealing are shopping#products. Go through the items and find all results that have kind of shopping#product. How many are there? Where else is this count information stored in the search results?
puts "************************************************************************************************************"
puts "Number 1 - Print the title of all products that have kind 'shopping#products *******************************"
puts "************************************************************************************************************"
puts
items = google_data["items"]
count_kinds = 0
items.each do |items|
    if items["kind"].index("shopping#product")
        puts " • " + items["product"]["title"]
        count_kinds += 1
    end
end
puts
puts "there are " + count_kinds.to_s + " kinds with shopping#products"
puts "the number of kinds with shopper#products is also found at google_data['currentItemCount'] - " + google_data['currentItemCount'].to_s
puts
puts "************************************************************************************************************"

#Number 2, Find all items with a backorder availability in inventories.
count_backorder = 0
puts "Number 2 - prints all stock with 'backorder' availability **************************************************"
puts "************************************************************************************************************"
puts
items.each do |items|
    availability = items["product"]["inventories"][0]["availability"]
    title = items["product"]["title"]
    if availability.index("backorder")
        puts " • " + title + ", has availability - " + availability 
        count_backorder += 1
    end
end
puts
puts "There is/are " + count_backorder.to_s + " orders on backorder"
puts
puts "************************************************************************************************************"

#Number 3, Find all items with more than one image link.
puts "Number 3 - Display items with more than one image link *****************************************************"
puts "************************************************************************************************************"
puts
count_image = 0
items.each do |items|
    image = items["product"]["images"]
    title = items["product"]["title"]
    if image.length > 1
        puts " • " + title + ", has more than one image link."
        count_image += 1
    end
end
puts
puts "there is/are " + count_image.to_s + " items with more than one image file"
puts
puts "************************************************************************************************************"

#Number 4, Find all canon products in the items (careful with case sensitivity).
puts "Number 4 - Display items by Canon **************************************************************************"
puts "************************************************************************************************************"
puts
count_brand = 0
items.each do |items|
    title = items["product"]["title"]
    brand = items["product"]["brand"]
    if brand.downcase.include?("canon")
        puts " • " + title + ", has brand " + brand
        count_brand += 1
    end
end
puts
puts "There is/are " + count_brand.to_s + " Canon branded items"
puts 
puts "************************************************************************************************************"

#Number 5, Find all items that have product author name of "eBay" and are brand "Canon".
puts "Number 5 - Display items by author eBay and brand Canon ****************************************************"
puts "************************************************************************************************************"
puts
count_authorbrand = 0
items.each do |items|
    author = items["product"]["author"]["name"]
    brand = items["product"]["brand"]
    title = items["product"]["title"]
    if brand.downcase.include?("canon")
        if author.downcase.include?("ebay")
            puts " • " + title + " has brand " + brand + " by author " + author
            count_authorbrand += 1
        end
    end
end
puts
puts "There is/are " + count_authorbrand.to_s + " Canon branded items by author eBay"
puts
puts "************************************************************************************************************"

#Number 6, Print all the products with their brand, price, and a image link.
puts "Number 6 - Print all the products with their brand, price, and a image link ********************************"
puts "************************************************************************************************************"
puts
items.each do |items|
    brand = items["product"]["brand"]
    title = items["product"]["title"]
    price = items["product"]["inventories"][0]["price"]
    image = items["product"]["images"][0]["link"]
    puts " • " + title
    puts "    with brand - " + brand
    puts "    price - " + price.to_s
    puts "    Image link: " + image 
    puts
end
puts
puts "************************************************************************************************************" 
