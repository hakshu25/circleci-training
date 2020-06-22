class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    if Book.create!(book_params)
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update!(book_params)
      redirect_to books_path
    else
      redirect_to edit_book_path(params[:id])
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end
end
