class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
