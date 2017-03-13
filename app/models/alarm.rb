class Alarm < ApplicationRecord
  has_many :upvotes

  validates :description, :presence => true
  validate :is_upper_case?

  def is_upper_case?
    if description && description.upcase != description
      errors.add(:description, "description must be uppercase")
    end
  end

  def serializable_hash(options)
    hash = super(options)
    puts(options)
    hash[:upvotes] = self.upvotes
    return hash
  end
end
