require './lib/Dish'

describe "Dish" do
	it "initializes the values if not passed" do
		dish = Dish.new
		expect(dish.name).to eq("No name given")
		expect(dish.price).to eq(0.00)
	end

	it "can print the name and price of a dish" do
		dish = Dish.new({:name => "Fried chicken", :price => 5.20})
		expect(dish.to_s).to eq("Fried chicken" + "."*17 + " £5.2")
	end
end
