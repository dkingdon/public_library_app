class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'Only letters allowed' }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'Only letters allowed' }
  validates :email, presence: true, uniqueness: true
  
end
