require_relative 'person'

class Student < Person
  attr_accessor :name, :classroom

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def new_classroom=(classroom)
    @classroom&.remove_student(self)
    @classroom = classroom
    classroom&.add_student(self)
  end
end
