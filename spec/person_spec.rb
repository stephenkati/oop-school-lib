require './person'

describe Person do
  context 'when testing person class' do
    before :all do
      @person = Person.new(22)
    end

    it 'should return name as unknown by default' do
      expect(@person.name).to eq('unknown')
    end

    it 'should return parent_permission as true by default' do
      expect(@person.parent_permission).to eq true
    end

    it 'should replace unkown with name parameter' do
      person = Person.new(22, name: 'Amika')
      expect(person.name).to eq('Amika')
    end

    it 'should replace true with parent_permission false' do
      person = Person.new(22, parent_permission: false)
      expect(person.parent_permission).to be false
    end

    it 'should assign id between 1 and 1000' do
      expect(@person.id).to be_between(1, 1000)
    end
  end

  context '' do
    before :all do
      @person = Person.new(22)
    end

    it 'should return true if person is of_age or has parent_permission' do
      expect(@person.can_use_services?).to be true
    end

    it 'should return name when correct_name is called' do
      expect(@person.correct_name).to be @person.name
    end

    it 'should return a hashed representation of person class when to_hash is called' do
      hashed_person = {
        id: @person.id,
        age: @person.age,
        name: @person.name,
        parent_permission: @person.parent_permission,
        rentals: @person.rentals.map(&:to_hash)
      }

      expect(@person.to_hash).to eq(hashed_person)
    end
  end
end
