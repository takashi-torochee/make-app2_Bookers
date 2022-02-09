class BooksController < ApplicationController

before_action :correct_book, only:[:edit, :update]
  def index
    @books = Book.all
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to book_path(@book.id)

    else
      @books = Book.all
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)

    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    @book = Book.find(params[:id])
     unless @book.user == current_user
     redirect_to books_path
     end
  end

end
