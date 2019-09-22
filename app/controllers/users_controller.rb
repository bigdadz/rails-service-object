class UsersController < ApplicationController
  def create
    result = UserCreator.call(name: user_params[:name])
    if result.success?
      render json: { message: 'Create User success.' }, status: :ok
    else
      render json: { message: 'Create User Fail.' }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
