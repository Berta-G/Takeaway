class Menu

	def initialize
		@dishes = []
	end
	attr_accessor :dishes

	def to_s
		header ++ "\n" + list_dishes + "\n" + footer
	end

	def add_dish(dish)
		dishes << dish
	end

	def header
		"MENU".center(80) 
	end

	def footer
		"END".center(80, "=")
	end

	def list_dishes
			dishes.inject("") {|list, dish| list << dish.to_s << "\n"} 
	end

end
