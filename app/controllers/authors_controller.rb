class AuthorsController < ApplicationController

  before_action :find_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.order(:last_name)
  end

  def show

  end

  def new
    @author = Author.new
  end

  def edit

  end

  def create
    @author = Author.new(author_params)

    @author.save ? redirect_to(@author) : render(:new)
  end

  def update
    @author.update(author_params) ? redirect_to(@author) : render(:edit)
  end

  def destroy
    if @author.destroy
      redirect_to authors_path, notice: 'Author successfully destroyed.'
    else
      redirect_to authors_path, flash: {error: 'Failed to destroy author.'}
    end
  end

  private

  def find_author
    begin
      @author = Author.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, book_ids: [])
  end
end
