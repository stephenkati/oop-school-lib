require './student'

describe Student do
  context 'When testing student class' do
    before :all do
      @student = Student.new(24, 'Java', name: 'Marion')
    end

    it 'should have age, name, classroom' do
      expect(@student).to have_attributes(age: 24)
      expect(@student).to have_attributes(name: 'Marion')
      expect(@student).to have_attributes(classroom: 'Java')
    end

    it 'should be able to use services' do
      expect(@student.can_use_services?).to be true
    end
  end
end
