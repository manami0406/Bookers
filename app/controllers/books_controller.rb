class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to show_book_path(@book.id)
    # 詳細画面へリダイレクトに直す
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "/books/#{book.id}" 
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  # ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
