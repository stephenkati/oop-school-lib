class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rentals_list
    Infor.rentals.select { |rental| rental.book == self }
  end

  def to_hash
    {
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_hash)
    }
  end
end
