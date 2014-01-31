require './lib/Takeaway.rb'

describe "Takeaway" do 
	let(:dish1) {double :dish}
	let(:dish2) {double :dish}
	let(:takeaway) {Takeaway.new([dish1, dish2])}
	
	it "initializes the menu array from the aray dishes" do	
		expect(takeaway.menu.size).to eq(2)
	end

	context "printint the menu" do
		it "prints all the dishes in the menu" do
			expect(dish1).to receive(:print).once
			expect(dish2).to receive(:print).once
			takeaway.print_menu
		end
	end

	

		
end
