require './classroom'
require './student'

describe Classroom do
  context 'when testing Classroom class' do
    before :all do
      @classroom = Classroom.new('label')
      @student = Student.new(21, 'Ruby on Rails')
    end

    it 'should have label attribute' do
      expect(@classroom).to have_attributes(label: 'label')
      expect(@classroom.students).to be_empty
    end

    it 'should take one parameter and return a Classroom object' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end

    it 'should add a student to the classroom' do
      @classroom.add_student(@student)

      expect(@classroom.students).to include(@student)
      expect(@student.classroom).to eq(@classroom)
    end
  end
end
