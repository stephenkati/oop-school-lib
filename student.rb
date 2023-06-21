require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission, :rentals

  def initialize(age, classroom, options = {})
    super(options)
    @age = age
    @classroom = classroom
    @parent_permission = options[:parent_permission]
    @rentals = []
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_rental(rental)
    rentals << rental
  end

  def remove_rental(rental)
    rentals.delete(rental)
  end

  private

  def of_age?
    age >= 18
  end
end
