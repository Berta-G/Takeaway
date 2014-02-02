require './lib/Menu'

describe 'Menu' do
	let(:menu) {Menu.new}
	let(:chicken) {double :dish, :name => "Chicken", :price => 5.00, :to_s => "Chicken"}
	let(:rice) {double :dish, :name => "Rice", :price => 5.50, :to_s => "Rice"}

	context "Initialize" do
		it "Initializes a empty dishes array" do
			expect(menu.dishes).to eq([])
		end
	end

	context "Functionalities" do
		it "can add a dish" do
			expect(menu.add_dish(chicken)).to eq([chicken])
			expect(menu.add_dish(rice)).to eq([chicken, rice])
		end

		it "can list the dishes" do 
			menu.add_dish(chicken)
			menu.add_dish(rice)
			expect(chicken).to receive(:to_s).once
			expect(rice).to receive(:to_s).once
			menu.list_dishes
		end
	end
end