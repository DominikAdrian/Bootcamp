require "pry"

data = {
  shipping_address: {
    address: "Pl. Tetuan 1",
    postal_code: "08013",
    city: "Barcelona",
    country: "Spain"
  },
  invoicing_address: {
    address: "Pl. Tetuan 1",
    postal_code: "08013",
    city: "Barcelona",
    country: "Spain"
  },
  cart: [
    {
      name: "PS4",
      price: 400
    },
    {
      name: "GTAV",
      price: 50
    }
  ]
}

class Order
  def initialize(data)
    binding.pry
  end
end

Order.new(data)



# arr = [ ] # ?
# p arr[0][5][:secret][:unlock][1]

# binding.pry