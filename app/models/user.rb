class User < ApplicationRecord
  has_secure_password

  has_many :instructed_courses, class_name: 'Course', foreign_key: 'instructor_id'
  has_many :announcements, foreign_key: 'author_id'

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