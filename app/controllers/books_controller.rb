class BooksController < ApplicationController
  
  def index
    @books = Book.all 
  end 

  def new 
    @book = Book.new
  end 

  def create
    @book = Book.create(book_params)
    table = UserBook.create(
    user_id: current_user.id,
    book_id: @book.id
    )
      
    redirect_to "/books/index"

  end 

  def show
     @book = Book.find(params[:id])
  end 

  
  def destroy 
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = "Book Removed From Library"
    redirect_to '/books/index'
  end

  private
  def book_params 
    params.require(:book).permit(:epub)
  end 



end