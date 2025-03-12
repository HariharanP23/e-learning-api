class Api::V1::AnnouncementsController < ApplicationController
  before_action :set_course
  before_action :set_announcement, only: [:update, :destroy]
  before_action :authorize_course_instructor, only: [:create, :update, :destroy]
  
  def index
    @announcements = @current_user.announcements.order(created_at: :desc).limit(5)
  end
  
  def create
    @announcement = @course.announcements.new(announcement_params)
    @announcement.author_id = @current_user.id
    if @announcement.save
      render_success "Create Successfully"
    else
      render json: { errors: @announcement.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    if @announcement.update(announcement_params)
      render :show
    else
      render json: { errors: @announcement.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @announcement.destroy
    render json: { message: "Announcement deleted successfully" }, status: :ok
  end
  
  private
  
  def set_course
    @course = Course.find_by(id: params[:course_id])
  end
  
  def set_announcement
    @announcement = @course.announcements.find(params[:id])
  end
  
  def announcement_params
    params.require(:announcement).permit(:title, :content)
  end
  
  def authorize_course_instructor
    unless @current_user&.admin? || @course.instructor_id == @current_user&.id
      render json: { error: "Not authorized to modify this course" }, status: :forbidden
    end
  end
end