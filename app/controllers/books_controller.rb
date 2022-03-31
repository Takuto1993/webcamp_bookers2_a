class BooksController < ApplicationController
  def new
    @book_image = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:name, :introduction)
  end
end
