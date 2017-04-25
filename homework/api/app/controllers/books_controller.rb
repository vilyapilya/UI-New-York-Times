class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def new
    # your code here
  end

  def create
    # your code here
  end

  def destroy
    book = Book.find_by(:id, params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
