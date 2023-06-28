require './book'

describe Book do
  context 'When testing book class' do
    before :all do
      @book = Book.new '12 Rules of life', 'Jardon Peterson'
    end

    it 'should have title and author attributes' do
      expect(@book).to have_attributes(title: '12 Rules of life')
      expect(@book).to have_attributes(author: 'Jardon Peterson')
    end

    it 'should take two parameters and return a Book object' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should have rentals list' do
      rental1 = double('Rental', book: @book)
      rental2 = double('Rental', book: @book)
      @book.rentals = [rental1, rental2]

      expect(@book.rentals_list).to eq([rental1, rental2])
    end
  end
end
