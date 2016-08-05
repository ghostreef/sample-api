class Response < ActiveRecord::Result
  attr_accessor :result

  def initialize(result)
    @result = result
    super(result.columns, result.rows)
  end

  def method_missing(name, *args)
    super
  end
end
