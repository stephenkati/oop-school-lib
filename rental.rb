class Rental
  attr_accessor :id, :date, :book, :person

  def initialize(date, book, person)
    @id = rand(1...1000)
    @date = date
    @book = book
    @person = person
  end

  def to_hash
    {
      id: @id,
      date: @date,
      book: @book,
      person: @person
    }
  end
end