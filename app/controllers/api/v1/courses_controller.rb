class Api::V1::CoursesController < ApplicationController
  before_action :authenticate_user

  def index
    @courses = Course.all
    @pagy, paginated_services = pagy(@courses)
    @pagination = pagy_metadata(@pagy)
  end

  def create
    @course = Course.new(course_params)
    @course.instructor_id = @current_user.id

    if @course.save
      render_success "Create Successfully"
    else
      render_error @course.errors, status: 422
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :term_id, :department)
  end
end
