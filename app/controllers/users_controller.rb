class UsersController < ApplicationController
  before_action :require_login
  before_action :ensure_current_user, {only: [:edit]}

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @books=Book.where(user_id: @user.id)
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=current_user
    if @user.update(user_params)
     redirect_to user_path(current_user.id)
     flash[:success]="You have updated user successfully."
    else
      render "users/edit"
    end
  end
end

    private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end