require_relative('../db/sql_runner.rb')

class GymClass

  attr_reader :id
  attr_accessor :name, :description, :instructor

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @description = details['description']
    @instructor = details['instructor']
  end

  def save()
    sql = "INSERT INTO classes (name, description, instructor)
          VALUES ($1, $2, $3)
          returning id"
    values = [@name, @description, @instructor]
    gym_class = SqlRunner.run(sql, values)
    @id = gym_class[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM classes"
    results = SqlRunner.run(sql)
    return results.map{ |gym_class| GymClass.new(gym_class) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM classes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return GymClass.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM classes"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM classes WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM CLASSES WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE classes
    SET (name, description, instructor)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @description, @instructor, @id]
    SqlRunner.run(sql, values)
  end






end
