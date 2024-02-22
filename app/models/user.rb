class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :password, length: { in: 6..15 }
  validates :name, length: { minimum: 2 }
  validates :email, uniqueness: true
end
