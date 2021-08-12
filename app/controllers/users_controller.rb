class UsersController < ApplicationController
  def index
    @user=User.find(current_user.id)
    @users=User.all
  end

  def show
    @user=User.find(current_user.id)
    @books=Book.where(user_id: @user)
  end

  def edit
    @user=User.find(current_user.id)
  end

  def update
    user=User.find(current_user.id)
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end
end

    private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end