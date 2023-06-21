class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end

  def add_students(*students)
    students.each { |student| add_student(student) }
  end

  def remove_student(student)
    if student.is_a?(Array)
      student.each { |student| remove_single_student(student) }
    else
      remove_single_student(student)
    end
  end

  private

  def remove_single_student(student)
    @students.delete(student)
    student.classroom = nil
  end
end
