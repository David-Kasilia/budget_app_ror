class Group < ApplicationRecord

    # Validations for the group model
  validates :name, presence: true, allow_blank: false

end
