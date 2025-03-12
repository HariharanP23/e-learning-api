class Course < ApplicationRecord
  belongs_to :term
  belongs_to :instructor, class_name: 'User'

  has_many :announcements, dependent: :destroy

  validates :title, :department, presence: true
  validates :status, inclusion: { in: %w[active closed] }
  validates :course_code, uniqueness: true, allow_nil: true

  before_validation :generate_course_code, on: :create

  private

  def generate_course_code
    random_number = rand(100..999)
    self.course_code = "#{department}-#{term.start_date.year}_#{random_number}"
  end
 
end