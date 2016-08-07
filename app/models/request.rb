class Request
  def execute(sql)
    ::Response.new(ActiveRecord::Base.connection.exec_query(sql))
  end
end
