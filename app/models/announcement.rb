class Announcement < ApplicationRecord
  belongs_to :course
  belongs_to :author, class_name: 'User'
    
  validates :title, :content, presence: true

  after_create :create_notification

  private

  def create_notification
    ActionCable.server.broadcast("notification_#{course_id}", { message: title })
  end
end
