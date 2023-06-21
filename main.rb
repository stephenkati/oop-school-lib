require_relative 'app'

loop do
  puts 'Please choose an option by entering a number'
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person (Teacher or Student).'
  puts '4 - Create a book.'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 - Exit'
  option = gets.chomp.to_i

  case option
  when 1
    list_books

  when 2
    list_people

  when 3
    create_person

  when 4
    new_book

  when 5
    new_rental

  when 6
    list_rentals

  when 7
    # Exit the loop
    break

  else
    puts 'Invalid option! Please choose a valid option.'
  end

  puts
end
