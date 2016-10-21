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
  Home.new("Ariel's place", "San Juan", 4, 49)
]


homes.each do |x|
  puts "\n #{x.name} in #{x.city} \n Price: $#{x.price} a night \n \n"
 end


# cities = []
# homes.each do |x|
#   cities.push(x.city)
# end
#
#but better:
# city_prices = homes.map {|x|x.price}
# puts city_prices

total_capacity = homes.reduce(0.0) {|sum, x| sum + x.capacity}
average_capacity = total_capacity/homes.length
puts "The average capacity is:"
puts average_capacity

total_prices = homes.reduce(0.0) {|sum, x| sum + x.price}
average_price = total_prices/homes.length
puts "The average price is:"
puts average_price

homes.each_with_index do |hm, index|
  puts "Home Number #{index + 1}: #{hm.name}"
end

high_capacity_homes = homes.select {|x| x.capacity >= 4}
puts high_capacity_homes

home_for_two_people = homes.find {|x| x.capacity == 2}
puts "The first home with enough space for 2 people is:"
puts home_for_two_people.name
