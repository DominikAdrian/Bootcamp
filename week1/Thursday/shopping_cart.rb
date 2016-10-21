require 'colorize'

class ShoppingCart
attr_accessor :items
	def initialize(items)
		@items = items
		@totalprice = 0
	end

	def add_item_to_cart(items)
		@items[items][:quantity] += 1 
	end
	

	def show
		puts "Item list:".colorize(:blue)
		@items.each do |x, i|
		puts "#{@items[x][:quantity]} #{x} each $#{@items[x][:price]}"
		end	
		add_free_bananas
	end	

	def cost
	free_bananas_discount = @freeBs * @items[:bananas][:price]
    price_twoforone = nil
    price_threefortwo = nil
    @items.each do |x,i|
	      if @items[x][:discount] == "2for1"
	        price_twoforone = (@items[x][:price])* (@items[x][:quantity]) - (@items[x][:price])*((@items[x][:quantity])/2)

	      elsif @items[x][:discount] == "3for2" 
	        price_threefortwo = (@items[x][:price])* (@items[x][:quantity]) - (@items[x][:price])*((@items[x][:quantity])/3)
	        	  
	      else
	        @totalprice += (@items[x][:price])* (@items[x][:quantity])

	      end
    	end
        @totalprice += price_twoforone
        @totalprice += price_threefortwo
        @totalprice -= free_bananas_discount
        puts "Your total price is $#{@totalprice}".colorize(:blue)
  	end				
end

def add_free_bananas
	@freeBs = @items [:grapes][:quantity] / 4
	if @freeBs >= 1
		puts "You have the option to receive #{@freeBs} free bananas(s). Do you want to take them? Answer 'yes' or 'no'!".colorize(:blue)
		bananas_choice = gets.chomp
		if bananas_choice == "yes"
			@items[:bananas][:quantity] += @freeBs
			puts "You receive #{@freeBs} free bananas(s)!"
			puts "New Item List".colorize(:blue)
			@items.each do |x, i|
			puts "#{@items[x][:quantity]} #{x} each $#{@items[x][:price]}"
			end
		end	
	end
end	


items = {
	:apples => {:price => 10, :quantity => 0, :discount => "2for1"},
	:orange => {:price => 5, :quantity => 0, :discount => "3for2"},
	:grapes => {:price => 15, :quantity => 0, :discount => "free bananas"},
	:bananas => {:price => 20, :quantity => 0},
	:watermelons => {:price => 50, :quantity => 0}
}


cart = ShoppingCart.new(items)

cart.add_item_to_cart :apples
cart.add_item_to_cart :apples
cart.add_item_to_cart :apples
cart.add_item_to_cart :bananas
cart.add_item_to_cart :bananas
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :watermelons
cart.add_item_to_cart :watermelons



cart.show
cart.cost