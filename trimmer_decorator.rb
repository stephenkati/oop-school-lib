require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  MAX_NAME_LENGTH = 10

  def correct_name
    @nameable.correct_name.strip[0, MAX_NAME_LENGTH]
  end
end
