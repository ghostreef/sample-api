class Response < ActiveRecord::Result
  attr_accessor :result

  def initialize(result)
    @result = result
    super(result.columns, result.rows)
  end
end
