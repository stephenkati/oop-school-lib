require './teacher'

describe Teacher do
  context 'When testing teacher class' do
    before :all do
      @teacher = Teacher.new(44, 'Mwangi', 'Swimming')
    end

    it 'should have age, name, specialization, parent_permission, rentals' do
      expect(@teacher).to have_attributes(age: 44)
      expect(@teacher).to have_attributes(name: 'Mwangi')
      expect(@teacher).to have_attributes(specialization: 'Swimming')
      expect(@teacher.rentals).to be_empty
    end

    it 'should return true when can_use_services? is called' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
