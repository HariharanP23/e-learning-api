class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :role, presence: true


  def admin?
    role == 'admin'
  end
  
  def instructor?
    role == 'instructor'
  end
  
  def student?
    role == 'student'
  end
end