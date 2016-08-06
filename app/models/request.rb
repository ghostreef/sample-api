class Request
  DEFAULT_LIMIT = 10
  MAX_LIMIT = 100

  def execute(table, options={})
    options.delete_if {|key, value| value.blank? }

    limit = options.fetch(:limit, DEFAULT_LIMIT)
    offset = options.fetch(:offset, 0)
    columns = options.fetch(:columns, '*')
    where = options.fetch(:where, {}).map { |k, v| "#{k}='#{v}'" }.join(' and ')
    order = options.fetch(:order, []).split(',')

    query = "SELECT #{columns} FROM #{table}"
    query += " WHERE #{where}" unless where.blank?
    query += " ORDER BY #{order[0]} #{order[1]}" unless order.blank?
    query += " LIMIT #{limit}"
    query += " OFFSET #{offset}"

    ::Response.new(ActiveRecord::Base.connection.exec_query(query))
  end
end
