class QueriesController < ApplicationController

  before_action :find_query, only: [:show, :edit, :update, :destroy]

  def index
    @queries = Query.order(:name)
  end

  def show

  end

  def new
    @query = Query.new
  end

  def edit

  end

  def create
    @query = Query.new(query_params)

    @query.save ? redirect_to(@query) : render(:new)
  end

  def update
    @query.update(query_params) ? redirect_to(@query) : render(:edit)
  end

  def destroy
    if @query.destroy
      redirect_to queries_path, notice: 'Query successfully destroyed.'
    else
      redirect_to queries_path, flash: {error: 'Failed to destroy query.'}
    end
  end

  private

  def find_query
    begin
      @query = Query.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def query_params
    params.require(:query).permit(:name, :sql, :status)
  end
end
