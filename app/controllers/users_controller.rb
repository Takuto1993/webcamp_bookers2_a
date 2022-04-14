class UsersController < ApplicationController

  def new
    @book = Book.new
    @user = User.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
    @booknew = Book.new
  end

  def index
    @booknew = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:update_U] = "You have updated user successfully."
       redirect_to user_path
     else
       render :edit
     end
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
