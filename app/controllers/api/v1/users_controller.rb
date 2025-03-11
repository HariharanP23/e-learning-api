class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    @user = User.new(user_params)

    if @user.save
    render json: { message: "User created successfully" }, status: 201
    else
    render_error(@user.errors.full_messages, 422)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :username)
  end
end