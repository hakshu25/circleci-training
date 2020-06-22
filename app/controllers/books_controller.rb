class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    if Book.create!(book_params)
      redirect_to '/books'
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end
end
