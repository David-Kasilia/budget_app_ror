class Group < ApplicationRecord

    # Database relations
    belongs_to :author, class_name: 'User', foreign_key: 'user_id'
    has_many :entities, dependent: :destroy

    # Validations for the group model
  validates :name, presence: true, allow_blank: false

end
