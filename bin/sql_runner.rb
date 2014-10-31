require_relative 'environment'

class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_sql_create
    sql = File.read("lib/create_table.sql")
    execute_sql(sql)
  end

  def execute_sql_insert
    sql = File.read("lib/insert.sql")
    execute_sql(sql)
  end

  def execute_sql(sql)
     sql.scan(/[^;]*;/m).each { |line| @db.execute(line) } unless sql.empty?
  end
end