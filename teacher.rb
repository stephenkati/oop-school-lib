require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :rentals

  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, parent_permission: parent_permission, name: name)
    @name = name
    @age = age
    @specialization = specialization
    @rentals = []
  end

  def can_use_services?
    true
  end

  def add_rental(rental)
    rentals << rental
  end

  def remove_rental(rental)
    rentals.delete(rental)
  end
end
