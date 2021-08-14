class BooksController < ApplicationController
  def index
    @book=Book.new
    @user=User.find(current_user.id)
    @books=Book.where(user_id: @user.id)
  end

  def show
    @user=User.find(current_user.id)
    @user_book=Book.find(params[:id])
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id= current_user.id
    if @book.save
      flash[:success]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user=User.find(current_user.id)
      @books=Book.where(user_id: @user.id)
      render "books/index"
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:success]="You have updated book successfully."
    else
      render "books/edit"
    end
  end

    private

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end
end
