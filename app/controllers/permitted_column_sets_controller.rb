class PermittedColumnSetsController < ApplicationController
  before_action :find_permitted_column_set, only: [:show, :edit, :update, :destroy]

  def index
    @permitted_column_sets = PermittedColumnSet.order(:name)
  end

  def show

  end

  def new
    @permitted_column_set = PermittedColumnSet.new
  end

  def edit

  end

  def create
    @permitted_column_set = PermittedColumnSet.new(permitted_column_set_params)

    @permitted_column_set.save ? redirect_to(@permitted_column_set) : render(:new)
  end

  def update
    @permitted_column_set.update(permitted_column_set_params) ? redirect_to(@permitted_column_set) : render(:edit)
  end

  def destroy
    if @permitted_column_set.destroy
      redirect_to permitted_column_sets_path, notice: 'Column set successfully destroyed.'
    else
      redirect_to permitted_column_sets_path, flash: {error: 'Failed to destroy column set.'}
    end
  end

  private

  def find_permitted_column_set
    begin
      @permitted_column_set = PermittedColumnSet.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def permitted_column_set_params
    params.require(:permitted_column_set).permit(:name, :slug, :permitted_table_id)
  end
end
