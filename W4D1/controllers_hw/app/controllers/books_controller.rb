class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    Book.create(title: params[:book][:title],author: params[:book][:author])
    redirect_to action: 'index'
  end

  def destroy

    # your code here
    # render json: Book.all
    target = Book.find_by(id: params[:id])
    target.destroy
    redirect_to action: 'index'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
