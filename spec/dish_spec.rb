require './lib/Dish'

describe "Dish" do

	let(:dish) {Dish.new("Fried chicken", 5.899)}
	it "initializes the values if not passed" do
		dish_no_data = Dish.new
		expect(dish_no_data.name).to eq("")
		expect(dish_no_data.price).to eq(0.00)
	end

	it "adjusts the given price to 2 decimals" do
		expect(dish.price).to eq(5.90)
	end

	it "capitalizes the given name" do
		expect(dish.name).to eq("Fried chicken")
	end

	it "can print the name and price of a dish" do
		expect(dish.to_s).to eq("Fried chicken" + "."*17 + " £5.9")
	end
end
