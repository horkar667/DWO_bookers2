class UsersController < ApplicationController
  def index
    @user=User.find(current_user.id)
    @users=User.all
    @book=Book.new
  end

  def show
    @user=User.find(current_user.id)
    @books=Book.where(user_id: @user.id)
    @book=Book.new
  end

  def edit
    @user=User.find(current_user.id)
  end

  def update
    @user=User.find(current_user.id)
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