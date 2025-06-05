class Companies::UsersController < ApplicationController

  def index
    users = User.by_company(params[:company_id])

    render json: users
  end
end
