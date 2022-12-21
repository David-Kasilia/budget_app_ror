class Entity < ApplicationRecord
  # Database relations
  belongs_to :author, class_name: 'User'
  has_many :groups, through: :group_entities
  has_many :group_entities, dependent: :destroy

  # Validations for the entitiy model
  validates :name, presence: true, allow_blank: false
  validates :amount, presence: true, allow_blank: false,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
