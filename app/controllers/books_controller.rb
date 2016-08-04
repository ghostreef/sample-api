class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.order(:title)
    respond_to do |format|
      format.html
      format.json {render text: @books.to_json}
      format.xml {render text: @books.to_xml}
    end
  end

  def show

  end

  def new
    @book = Book.new
  end

  def edit

  end

  def create
    @book = Book.new(book_params)

    @book.save ? redirect_to(@book) : render(:new)
  end

  def update
    @book.update(book_params) ? redirect_to(@book) : render(:edit)
  end

  def destroy
    if @book.destroy
      redirect_to books_path, notice: 'Book successfully destroyed.'
    else
      redirect_to books_path, flash: {error: 'Failed to destroy book.'}
    end
  end

  private

  def find_book
    begin
      @book = Book.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def book_params
    params.require(:book).permit(:title, :isbn, author_ids: [])
  end
end
