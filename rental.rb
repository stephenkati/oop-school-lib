class Rental
  attr_accessor :id, :date, :book, :person

  def initialize(date, book, person)
    @id = Infor.generate_rental_id
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
    Infor.rentals << self
  end
end
