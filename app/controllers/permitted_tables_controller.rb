class PermittedTablesController < ApplicationController
  before_action :find_permitted_table, only: [:show, :edit, :update, :destroy]

  def index
    @permitted_tables = PermittedTable.order(:name)
  end

  def show

  end

  def new
    @permitted_table = PermittedTable.new
  end

  def edit

  end

  def create
    @permitted_table = PermittedTable.new(permitted_table_params)

    @permitted_table.save ? redirect_to(@permitted_table) : render(:new)
  end

  def update
    @permitted_table.update(permitted_table_params) ? redirect_to(@permitted_table) : render(:edit)
  end

  def destroy
    if @permitted_table.destroy
      redirect_to permitted_tables_path, notice: 'PermittedTable successfully destroyed.'
    else
      redirect_to permitted_tables_path, flash: {error: 'Failed to destroy permitted_table.'}
    end
  end

  private

  def find_permitted_table
    begin
      @permitted_table = PermittedTable.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def permitted_table_params
    params.require(:permitted_table).permit(:name, :slug)
  end
end
