require_relative('../db/sql_runner.rb')

class Session

  attr_reader :id
  attr_accessor :class_time, :max_capactiy

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @class_time = details['class_time']
    @max_capactiy = details['max_capactiy'].to_i
  end

  def save()
    sql = "INSERT INTO sessions (class_time, max_capactiy)
          VALUES ($1, $2)
          RETURNING id"
    values = [@class_time, @max_capactiy]
    session = SqlRunner.run(sql, values)
    @id = session[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run(sql)
    return results.map{ |session| Session.new(session) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Session.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM sessions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sessions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE sessions
    SET (class_time, max_capactiy)
    = ($1, $2)
    WHERE id = $3"
    values = [@class_time, @max_capactiy, @id]
    SqlRunner.run(sql, values)
  end


end
