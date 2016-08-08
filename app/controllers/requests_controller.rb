class RequestsController < ApplicationController
  def show
    # grab and delete name
    name = params.delete(:query_name)

    # is it a predefined query?
    query = Query.find_by_name(name)

    # no? let's build it out
    table = PermittedTable.find_by_slug(name) if query.nil?
    if table.present?
      options = {}
      options[:limit] = params.delete(:limit)
      options[:offset] = params.delete(:offset)
      options[:order] = params.delete(:order)
      options[:where] = params.permit(table.all_columns)
      query = Query.build_query(table.name, options)
    end

    head :unauthorized and return if query.nil?

    @response = Request.new.execute(query.sql)

    respond_to do |format|
      format.html
      format.json {render text: @response.to_json}
    end
  end
end

