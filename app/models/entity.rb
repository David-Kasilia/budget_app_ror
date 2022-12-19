class Entity < ApplicationRecord

    # Validations for the entitiy model
  validates :name, presence: true, allow_blank: false
  validates :amount, presence: true, allow_blank: false, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
