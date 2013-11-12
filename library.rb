class Library
	def initialize(&block)
		@orders = []
		instance_eval(&block)
	end

	def reader(name, &block)
		@current_reader = name
		if block_given?
			instance_eval(&block)
		end
	end

	def smallest_period_for_which_library_found_a_book
		@orders.select(&:satisfied).map(&:issue_duration).min
	end

	def how_many_orders_were_not_satisfied?
		@orders.select { |order| !order.satisfied }.count
	end

	def who_often_takes_the_book?(title)
		orders_for_book = @orders.select { |order| order.book == title }
		readers_of_book = orders_for_book.group_by(&:reader)

		max_order_count = readers_of_book.each_value.map(&:count).max
		who_often_takes = readers_of_book.select do |reader, orders|
			orders.count > 1 && orders.count == max_order_count 
		end
		who_often_takes.keys
	end

	def what_is_the_most_popular_book?
		orders_by_book = @orders.group_by { |order| order.book }
		max_order_count = orders_by_book.each_value.map(&:count).max
		orders_by_book.find { |book, orders| orders.count == max_order_count }[0]
	end

	def how_many_people_ordered_one_of_three_most_popular_books?
		@orders.
			group_by { |order| order.book }.
			sort_by { |book, orders| -orders.count }.
			take(3).
			map { |pair| pair[0] }.
			map { |book| [book, @orders.select { |order| order.book == book }.count] }
	end

	def to_s
		s = "---\n"
		@orders.each do |o|
			s << "#{o}\n---\n"
		end
		s
	end

	protected

	def ordered(info = {}, &block)
		return unless @current_reader or
				info.has_key?(:book) or
				info.has_key?(:at)

		book, order_date = info[:book], info[:at]
		@current_order = Order.new(book, @current_reader, order_date)
		@orders.push @current_order

		@current_order.instance_eval(&block) if block_given?
	end

end
