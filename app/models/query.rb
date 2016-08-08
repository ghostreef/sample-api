class Query < ActiveRecord::Base
  DEFAULT_LIMIT = 10
  MAX_LIMIT = 100

  validates :name, :sql, presence: true
  validates :name, uniqueness: true

  enum status: {enabled: 0,
                disabled: 1}

  # should this return a query object?
  def self.build_query(table, options={})
    options.delete_if {|key, value| value.blank? }

    limit = options.fetch(:limit, DEFAULT_LIMIT)
    offset = options.fetch(:offset, 0)
    columns = options[:columns].present? ? options[:columns].map{|c| c.to_s}.join(', ') : '*'
    where = options.fetch(:where, {}).map { |k, v| "#{k}='#{v}'" }.join(' and ')
    order = options.fetch(:order, []).split(',')

    query = "SELECT #{columns} FROM #{table}"
    query += " WHERE #{where}" unless where.blank?
    query += " ORDER BY #{order[0]} #{order[1]}" if order.length == 2
    query += " LIMIT #{limit}"
    query += " OFFSET #{offset}"

    self.new(name: 'runtime query', sql: query)
  end
end
