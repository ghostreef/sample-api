class Request
  DEFAULT_LIMIT = 10
  MAX_LIMIT = 100

  def execute(table, options={})
    limit = options.fetch(:limit, DEFAULT_LIMIT)
    columns = options.fetch(:columns, '*')

    ::Response.new(ActiveRecord::Base.connection.exec_query("SELECT #{columns} FROM #{table} LIMIT #{limit}"))
  end
end
