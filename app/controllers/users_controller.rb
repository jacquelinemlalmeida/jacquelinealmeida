class UsersController < ApplicationController

  def index
    users = User.by_username(search_params[:username])
    render json: users
  end

  private

  def search_params
    params.permit(:username)
  end

end
