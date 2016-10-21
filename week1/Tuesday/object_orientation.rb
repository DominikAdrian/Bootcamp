#Classes vs Instances

#Class
#class Auto
#  def make_noise
#    puts "peng"
#  end
#end
#auto = Auto.new
#auto.make_noise

#Instance
class Car
	def initialize (sound)
	@sound = sound
	@cities = []
	first_visit
	end

	def make_sound
		puts @sound
	end

	def self.speed_control
		puts "What is your current speed in km/h?"
		speed = gets.chomp.to_i
		if speed > 100
			puts "Hey slow down!"
		end
	end	

	def first_visit
		empty_array = Marshal.dump([])
		IO.write("cities", empty_array)
	end

	def visit (city)
		marshaled_cities = Marshal.dump([city] + cities)
		IO.write("cities", marshaled_cities)
	end

	def cities
		marshaled_cities = IO.read("cities")
		Marshal.load(marshaled_cities)
	end	
end

class RacingCar < Car
	def initialize
	end
	def make_sound2
		puts "BROOOM"
	end
end

class Person
	attr_reader (:name)
	attr_accessor (:age)

	def initialize (name, age)
		@name = name
		@age = age
	end	
end	


car = Car.new ("BROOM")
racingCar = RacingCar.new
car2 = Car.new ("broom")
john = Person.new "John", 23


#car.make_sound
#car2.make_noise
#Car.speed_control
#car.visit ("Barcelona")
#car.visit ("Madrid")
#p car.cities
puts racingCar.make_sound2
john.age










