require 'colorize'

class Home
  attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Dom's place", "Munich", 1, 48),
  Home.new("Maxime's place", "Toulouse", 1, 34),
  Home.new("Kudryatzhan's place", "Baku", 3, 45),
  Home.new("Max's place", "Bielefeld", 2, 45),
  Home.new("Marc's place", "Barcelona", 4, 41)
]

puts "The following houses are available:".colorize(:green)

homes.each do |x|
  puts "#{x.name} in #{x.city} \n Price: $#{x.price} a night\n\n"
end

#2
user_choice = false
while user_choice == false

puts "How do you want to sort the accomodation options? ('pricehigh' , 'pricelow' or 'capacity')".colorize(:red)
sorting_choice = gets.chomp

	if sorting_choice == "pricehigh"
		sorted_homes = homes.sort{|x, y| y.price <=> x.price}
		sorted_homes.each {|x| puts "#{x.name} in #{x.city} \nPrice: $#{x.price} a night\n\n"}
		user_choice = true

	elsif sorting_choice == "pricelow"
		sorted_homes = homes.sort{|x, y| x.price <=> y.price}
		sorted_homes.each {|x| puts "#{x.name} in #{x.city} \nPrice: $#{x.price} a night\n\n"}
		user_choice = true

	elsif sorting_choice == "capacity"
		sorted_homes = homes.sort_by{|x| x.capacity}
		sorted_homes.each {|x| puts "#{x.name} in #{x.city} \nPrice: $#{x.price} a night\n\n"}
		user_choice = true

	else
		puts "You did not choose a valid sorting parameter. Choose again! \n 
		How do you want to sort by ('pricehigh' , 'pricelow' or 'capacity')? "
		user_choice = false
	end	
end

puts "Do you wish to filter out a specific city? (type 'yes' or 'no'!)".colorize(:red)
filter_choice = gets.chomp
if filter_choice == "yes"
	puts "By what city do you want to filter?".colorize(:red)
	city_choice = gets.chomp
	cities_filtered = sorted_homes.select {|x| x.city == city_choice.capitalize}
	cities_filtered.each {|x| puts "#{x.name} in #{x.city} \nPrice: $#{x.price} a night \n\n".colorize(:green)}
	prices_filtered = cities_filtered.map {|x|x.price}
	total_prices = prices_filtered.reduce(0.0) {|sum, x| sum + x}
	average_price = total_prices / prices_filtered.size
	puts "The average price for your selected cities is #{average_price}.".colorize(:blue)
else
	prices_filtered = sorted_homes.map {|x|x.price}
	total_prices = prices_filtered.reduce(0.0) {|sum, x| sum + x}
	average_price = total_prices / prices_filtered.size
	puts "The average price for your selected cities is #{average_price}.".colorize(:blue)	
end	

puts "What is the maximum price you are willing to pay for your accomodation?"
maximum_price = gets.chomp
match_price = homes.find {|x|x.price == maximum_price}

if match_price == nil
	puts "Unfortunately there is no accommodation with your requested price per night. However, here is a list of available accomodations with a cheaper price:"
	alternative_homes = homes.delete_if {|x| x.price >= maximum_price_to_i}
	alternative_homes.each do |x|
  	puts "#{x.name} in #{x.city} \n Price: $#{x.price} a night\n\n"
	end
else
	puts "The first accomodation that fulfills your criteria is:"	
	puts "#{match_price.name} in #{match_price.city} for $#{match_price.price} a night."
end	




