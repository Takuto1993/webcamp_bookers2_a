class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @user = User.find(params[:id])
    @book = @user.book
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user_id)
  end

  private
  def user_params
   params.reauire(:user).permit(:name, :introduction)
  end
end
