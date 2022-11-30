class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
        flash[:notice] = 'You hove created book successfully'
        redirect_to books_path
    else
      render :index
    end
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
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
       flash[:notice] = 'You hove updated book successfully'
       redirect_to book_path(@book.id)
    else
      render :edit
    end
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
