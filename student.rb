require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission, :rentals

   def initialize(age, classroom, name: 'unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def can_use_services?
    of_age? || parent_permission
  end

  private

  def of_age?
    age >= 18
  end
end
