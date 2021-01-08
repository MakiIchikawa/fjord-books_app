class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

end
