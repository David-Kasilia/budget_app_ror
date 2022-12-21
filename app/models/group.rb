class Group < ApplicationRecord
  # Database relations
  belongs_to :author, class_name: 'User'
  has_many :entities, through: :group_entities
  has_many :group_entities, dependent: :destroy

  # Validations for the group model
  validates :name, presence: true, allow_blank: false
  validates :icon, presence: true, allow_blank: false
end
