require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(27)
puts person.name
puts person.age
puts person.can_use_services?

student = Student.new(19, 'class 8')
puts student.name
puts student.age
puts student.can_use_services?
puts student.play_hooky

teacher = Teacher.new(41, 'Mathematics')
puts teacher.name
puts teacher.age
puts teacher.can_use_services?

person_with_permission = Person.new(20, parent_permission: true)
person_without_permission = Person.new(16, parent_permission: false)

puts person_with_permission.can_use_services?
puts person_without_permission.can_use_services?

person = Person.new(22, name: 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name