class RequestsController < ApplicationController
  def show
    @table = PermittedTable.find_by_slug(params.delete(:slug))
    head :unauthorized and return if @table.nil?

    options = {}
    options[:limit] = params.delete(:limit)
    options[:offset] = params.delete(:offset)
    options[:order] = params.delete(:order)
    options[:where] = params.delete_if {|key, value| %w(action controller format).include?(key) }

    @response = Request.new.execute(@table.name, options)

    respond_to do |format|
      format.html
      format.json {render text: @response.to_json}
    end
  end
end

