class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:create] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
     render :show
    end
  end

  def index
    @booknew = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update_B] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to @book
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
