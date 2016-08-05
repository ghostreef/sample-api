class RequestsController < ApplicationController
  def show
    @table = PermittedTable.find_by_slug(params[:slug])
    head :unauthorized if @table.nil?

    @response = Request.new.execute(@table.name)

    # of course you don't need a view, but I'll add one for development
  end
end
