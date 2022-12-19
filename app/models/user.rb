class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  # Database relations

  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy

  # Validations for the user model
    validates :name, presence: true, allow_blank: false

  ROLES = %i[admin default].freeze
end
