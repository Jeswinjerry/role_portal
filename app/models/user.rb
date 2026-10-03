class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable

  USER_TYPES = %w[admin support teacher student].freeze

  validates :user_type, inclusion: { in: USER_TYPES }
  validates :name, presence: true
end