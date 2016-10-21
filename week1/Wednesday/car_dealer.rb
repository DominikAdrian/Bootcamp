require "pry"

class CarDealer
  def initialize(inventory)
    @inventory = inventory
  end

  def cars(brand)
    @inventory[brand.to_sym]
  end

  def print_inventory
    @inventory.each do |brand, cars|
      puts "#{brand}: #{cars.join(", ")}"
    end
  end
end

my_inventory = {
  Ford: ["Fiesta", "Mustang"],
  Honda: ["Civic", "CR-V"]
}

car_dealer = CarDealer.new(my_inventory)
car_dealer.cars("Ford")  # ["Fiesta", "Mustang"]
car_dealer.print_inventory
# Ford: Fiesta, Mustang
# Honda: Civic, CR-V

binding.pry