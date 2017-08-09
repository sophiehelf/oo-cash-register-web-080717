class CashRegister
	attr_accessor :amount, :price
	def initialize (the_discount = 0, the_amount=1, the_name = "")
		@discount = the_discount
		@amount = the_amount
		@name = the_name
		@total = 0
		@@all_items = []
		def discount
			@discount 
		end
	end

	def total
		@total
	end

	def total=(total)
		@total = total
	end

	def add_item(title, price, amount=1)
		@total = @total + (price * amount)
		i = 0
		@@items_hash = Hash.new
		until i >= amount 
			@@all_items << title 
			@@items_hash[title] = price
			i+=1
		end
	end

	def apply_discount
		@total = @total - (@total * @discount * 0.01)
		if @discount == 0
			"There is no discount to apply."
		else
			"After the discount, the total comes to $#{@total.to_i}."
		end
	end

	def void_last_transaction
		@total = @total - @@items_hash[@@all_items.last]
	end

	def items
		@@all_items
	end

end