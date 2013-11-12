class Order
	attr_reader :book, :reader, :order_date, :issue_date, :satisfied

	def initialize(book, reader, order_date)
		@book, @reader, @order_date = book, reader, order_date
		@satisfied = false
	end
	
	def got_after(period)
		@issue_date = @order_date + period
		@satisfied = true
	end

	def issue_duration
		((@issue_date || Date.new) - @order_date).to_i
	end

	def did_not_get_it
	end

	def to_s
		s = "Book: #{book}\n"
		s << "Reader: #{reader}\n"
		s << "Order date:#{order_date}\n"
		s << "Issue date:#{issue_date}\n"
		s << "Satisfied: #{@satisfied}"
	end
end
