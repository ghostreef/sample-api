class LibrariesController < ApplicationController

  before_action :find_library, only: [:show, :edit, :update, :destroy]

  def index
    @libraries = Library.order(:name)
  end

  def show

  end

  def new
    @library = Library.new
  end

  def edit

  end

  def create
    @library = Library.new(library_params)

    @library.save ? redirect_to(@library) : render(:new)
  end

  def update
    @library.update(library_params) ? redirect_to(@library) : render(:edit)
  end

  def destroy
    if @library.destroy
      redirect_to libraries_path, notice: 'Library successfully destroyed.'
    else
      redirect_to libraries_path, flash: {error: 'Failed to destroy library.'}
    end
  end

  private

  def find_library
    begin
      @library = Library.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def library_params
    params.require(:library).permit(:year_built, :name, :address)
  end
end
