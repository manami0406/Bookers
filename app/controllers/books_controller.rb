class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to '/books'
    # 詳細画面へリダイレクトに直す
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  private
  # ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
