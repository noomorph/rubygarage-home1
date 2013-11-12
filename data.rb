def test_library
	Library.new do
		reader 'Agathe' do
			ordered book: 'Missing Book', at: Date.new(2013, 10, 01) do 
				got_after 1.day
			end
			ordered book: 'Behold the Man', at: Date.new(2013, 10, 04) do
				got_after 2.days
			end
			ordered book: 'Cabbages and Kings', at: Date.new(2013, 10, 01) do
				did_not_get_it
			end
			ordered book: 'Cabbages and Kings', at: Date.new(2013, 10, 17) do
				got_after 3.day
			end
		end

		reader 'John' do
			ordered book: 'Fanatic Heart', at: Date.new(2013, 11, 01)
		end

		reader 'Sam' do
			ordered book: 'Fanatic Heart', at: Date.new(2013, 9, 1) do
				got_after 3.days
			end
		end
	end
end

# Other examples:
# 'No Highway'
# 'Vanity Fair'
# 'Endless Night'
# 'Behold the Man'
# 'Ah, Wilderness!'
# 'Clouds of Witness'
# 'Cabbages and Kings'
# 'The Mermaids Singing'
