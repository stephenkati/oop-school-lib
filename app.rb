require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'
require_relative 'book'
require_relative 'preserve_data'

module Infor
  @people = []
  @books = []
  @rentals = []

  class << self
    attr_accessor :rentals
  end

  def self.people
    @people
  end

  def self.books
    @books
  end

  def self.generate_person_id
    @people.length
  end
end

def new_teacher
  puts "Enter the teacher's name:"
  name = gets.chomp
  puts "Enter the teacher's specialization:"
  specialization = gets.chomp
  puts "Enter the teacher's age:"
  age = gets.chomp.to_i

  teacher = Teacher.new(age, specialization, name: name)
  teacher.instance_variable_set(:@id, Infor.generate_person_id)
  Infor.people << teacher
  file_write('people.json', Infor.people)

  puts "Teacher #{name} added!"
  puts ' '
end

def new_student
  puts "Enter the student's name:"
  name = gets.chomp
  puts "Enter the student's classroom:"
  classroom = gets.chomp
  puts "Enter the student's age:"
  age = gets.chomp.to_i
  puts 'Has parent permission? [Y/N]:'
  parent_permission = gets.chomp
  parent_permission = true if %w[Y y].include?(parent_permission)
  parent_permission = false if %w[N n].include?(parent_permission)

  student = Student.new(age, classroom, name: name, parent_permission: parent_permission)
  student.instance_variable_set(:@id, Infor.generate_person_id)
  Infor.people << student
  file_write('people.json', Infor.people)

  puts "Student #{name} added!"
  puts ' '
end

def create_person
  puts 'Enter the type of person:'
  puts '1 - Student'
  puts '2 - Teacher'
  person_type = gets.chomp.to_i

  case person_type
  when 1
    new_student
  when 2
    new_teacher
  else
    puts 'Invalid option! Please choose a valid option.'
  end
end

def list_people
  puts 'Listing all people...'
  @people = file_read('people.json')
  @people.each do |person|
    puts "Id: #{person['id']}, Name: #{person['name']}, Age: #{person['age']}"
  end
  puts ' '
end

def new_book
  puts 'Enter book title:'
  title = gets.chomp
  puts 'Enter book author:'
  author = gets.chomp

  book = Book.new(title, author)
  Infor.books << book
  file_write('books.json', Infor.books)
  puts "Book '#{title}' added successfully!"
  puts ' '
end

def list_books
  puts 'Listing all books...'
  @books = file_read('books.json')
  @books.each do |book|
    puts "Title: #{book['title']}, Author: #{book['author']}"
  end
  puts ' '
end

def student_teacher
  @people = file_read('')
  @people.each do |person|
    puts "#{person['id']} - Name: #{person['name']}, Age: #{person['age']}"
  end
  puts ' '
end

def new_rental
  puts 'Choose a person from the list below by number:'
  people = file_read('people.json')
  people.each_with_index do |person, index|
    puts "#{index} - Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
  end
  person_index = gets.chomp.to_i

  puts 'Choose a book from the list below by number:'
  books = file_read('books.json')
  books.each_with_index do |book, index|
    puts "#{index} - Title: #{book['title']}, Author: #{book['author']}"
  end
  book_index = gets.chomp.to_i

  puts 'Enter the rental date (YYYY-MM-DD):'
  date = gets.chomp

  book = books[book_index]
  person = people[person_index]

  Infor.rentals << Rental.new(date, book, person)
  file_write('rentals.json', Infor.rentals)

  puts 'Rental added successfully!'
end

def list_rentals
  rentals = file_read('rentals.json')
  puts 'Enter the person ID to list rentals:'
  people = file_read('people.json')
  people.each_with_index do |person, index|
    puts "#{index} - Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
  end
  person_id = gets.chomp.to_i

  rentals_available = rentals.select { |rental| rental['person']['id'] == person_id }

  if rentals_available.empty?
    puts "No rentals available for the person with ID #{person_id}."
  else
    puts "Listing rentals for the person with ID #{person_id}:"
    rentals_available.each do |rental|
      puts "Rental Date: #{rental['date']}"
      puts
    end
  end
end
