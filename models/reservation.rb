require_relative('../db/sql_runner.rb')

class Reservation

  attr_reader :id
  attr_accessor :member_id, :gym_class_id#, :session_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @member_id = details['member_id'].to_i
    @gym_class_id = details['gym_class_id'].to_i
    #@session_id = details['session_id'].to_i
  end

  def save()
    sql = "INSERT INTO reservations (member_id, gym_class_id)
          VALUES ($1, $2)
          RETURNING id"
    values = [@member_id, @gym_class_id]
    reservation = SqlRunner.run(sql, values)
    @id = reservation[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM reservations"
    results = SqlRunner.run(sql)
    return results.map{ |reservation| Reservation.new(reservation) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM reservations WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Session.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM reservations"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM reservations WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM reservations WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE reservations
    SET (member_id, gym_class_id)
    = ($1, $2)
    WHERE id = $3"
    values = [@member_id, @gym_class_id, @id]
    SqlRunner.run(sql, values)
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)[0]
    return Member.new(results)
  end

  def gym_class()
    sql = "SELECT * FROM classes WHERE id = $1"
    values = [@gym_class_id]
    results = SqlRunner.run(sql, values)[0]
    return GymClass.new(results)
  end

  def capacity_check(gym_class)
    if gym_class.members_attending() < gym_class.max_capacity()
      return true
    else
      return false
    end
  end

end
