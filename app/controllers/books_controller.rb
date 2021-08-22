class BooksController < ApplicationController
  before_action :require_login
  before_action :ensure_current_user_book, {only: [:edit]}

  def index
    @book=Book.new
    @user=current_user
    @books=Book.all
  end

  def show
    @book_user=Book.find(params[:id])
    @book=Book.new
    @book_comment=BookComment.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id= current_user.id
    if @book.save
      flash[:success]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user=current_user
      @books=Book.all
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

  def ensure_current_user_book
    book = Book.find(params[:id])
    if current_user.id != book.user.id
     redirect_to books_path
    end
  end