class Alarm < ApplicationRecord
  validate :is_upper_case?

  def is_upper_case?
    if description.upcase != description
      errors.add(:description, "description must be uppercase")
    end
  end
end
