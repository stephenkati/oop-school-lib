class Rental
  attr_accessor :id, :date, :book, :person

  def initialize(date, book, person)
    @id = Data.generate_rental_id
    @date = date
    assign_book(book)
    assign_person(person)
    Data.rentals << self
  end

  def self.find_by_person_id(person_id)
    Data.rentals.select { |rental| rental.person.id == person_id }
  end

  private

  def assign_book(book)
    @book = book
    book.rentals << self
  end

  def assign_person(person)
    @person = person
    person.rentals << self
  end
end
