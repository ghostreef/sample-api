class Request
  def execute(table, columns=nil)
    ::Response.new(ActiveRecord::Base.connection.exec_query("SELECT * FROM #{table}"))
  end
end
