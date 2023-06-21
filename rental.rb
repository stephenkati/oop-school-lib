class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    assign_book(book)
    assign_person(person)
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
