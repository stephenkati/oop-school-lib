require './rental'
require './book'
require './teacher'
require './app'

describe Rental do
  context 'When testing rental class' do
    before :all do
      @book = Book.new 'Atomic Habits', 'James Clear'
      @teacher = Teacher.new(44, 'Swimming', name: 'Mwangi')
      @rental = Rental.new('2023/01/01', @book, @teacher)
    end

    it 'should be able to know who rented a book (student/teacher)' do
      expect(@rental.person).to be @teacher
    end

    it 'should be able to know which book was rented' do
      expect(@rental.book).to be @book
    end
  end
end
