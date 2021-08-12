class BooksController < ApplicationController
  def index
    @user=User.find(current_user.id)
    @books=Book.all
  end
  
  def show
  end
end
