require 'date'
require './helpers.rb'
require './order.rb'
require './library.rb'
require './data.rb'

# Test 
library = test_library
puts library

puts "\n---"
answer = library.smallest_period_for_which_library_found_a_book
puts "Smallest period for which library found a book: #{answer} day(s)"

puts "\n---"
answer = library.how_many_orders_were_not_satisfied?
puts "How many orders were not satisfied? #{answer}"

puts "\n---"
book = "Cabbages and Kings"
answer = library.who_often_takes_the_book?(book)
puts "- Who often takes the \"#{book}\"?\n- #{answer}"

puts "\n---"
answer = library.what_is_the_most_popular_book?
puts "- What is the most popular book?\n- #{answer}"

puts "\n---"
puts "How many people ordered one of three most popular books?"
puts library.how_many_people_ordered_one_of_three_most_popular_books?.inspect

