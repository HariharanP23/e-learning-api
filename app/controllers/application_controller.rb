class ApplicationController < ActionController::API

  before_action :authenticate_user

  private

  def authenticate_user
    unless current_user
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end
    
  def current_user
    def authenticate_user
      payload = JWT.decode(request.headers["Authorization"].split(" ").last, ENV["ACCESS_TOKEN_SECRET"], true, { algorithm: "HS256" })
      @current_user = User.find_by(id: payload[0]["user_id"])
    rescue JWT::ExpiredSignature
      render_error("Access token expired", 401)
    rescue JWT::DecodeError
      render_error("Invalid access token", 401)
    end
  end
  
  def authorize_admin
    unless @current_user&.admin?
      render json: { error: "Not authorized as admin" }, status: :forbidden
    end
  end
  
  def authorize_instructor
    unless @current_user&.instructor? || @current_user&.admin?
      render json: { error: "Not authorized as instructor" }, status: :forbidden
    end
  end
  
  def authorize_course_instructor(course)
    unless @current_user&.admin? || course.instructor_id == @current_user&.id
      render json: { error: "Not authorized to modify this course" }, status: :forbidden
    end
  end

  def render_error(errors, status)
    render json: {
      status: status,
      message: errors.is_a?(Array) ? errors.join(", ") : errors
    }, status: status
  end
end
