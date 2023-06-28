require './student'
require './classroom'

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

    it 'should add the student to the classroom' do
      classroom = Classroom.new('Math')
      @student.add_classroom(classroom)

      expect(classroom.students).to include(@student)
    end

    it 'should not add the student to the classroom if already present' do
      classroom = Classroom.new('Math')
      classroom.students << @student

      @student.add_classroom(classroom)

      expect(classroom.students.count(@student)).to eq(1)
    end
  end
end
