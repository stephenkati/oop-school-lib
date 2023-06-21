class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rentals_list
    Data.rentals.select { |rental| rental.book == self }
  end
end
