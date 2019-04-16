require('time')
require_relative('../db/sql_runner.rb')

class GymClass

  attr_reader :id
  attr_accessor :name, :description, :instructor, :class_time, :max_capacity

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @description = details['description']
    @instructor = details['instructor']
    @class_time = details['class_time']
    @max_capacity = details['max_capacity'].to_i
  end

  def save()
    sql = "INSERT INTO classes (name, description, instructor, class_time, max_capacity)
          VALUES ($1, $2, $3, $4, $5)
          returning id"
    values = [@name, @description, @instructor, @class_time, @max_capacity]
    gym_class = SqlRunner.run(sql, values)
    @id = gym_class[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM classes ORDER BY class_time ASC"
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
    sql = "DELETE FROM classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE classes
    SET (name, description, instructor, class_time, max_capacity)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@name, @description, @instructor, @class_time, @max_capacity, @id]
    SqlRunner.run(sql, values)
  end

  def members()
    sql = "SELECT members.* FROM members
    INNER JOIN reservations ON reservations.member_id = members.id
    WHERE reservations.gym_class_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def premium_members()
    sql = "SELECT members.* FROM members
    INNER JOIN reservations on reservations.member_id = members.id
    WHERE reservations.gym_class_id = $1 AND members.membership_type = $2"
    values = [@id, "Premium"]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def reservations
    sql = "SELECT * FROM reservations WHERE reservations.gym_class_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |reservation| Reservation.new(reservation) }
  end

  def remove_reservations()
    sql = "DELETE FROM reservations WHERE reservations.gym_class_id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete_reservation_by_id(id)
    sql = "DELETE FROM reservations
    WHERE reservations.gym_class_id = $1 AND reservations.member_id = $2"
    values = [@id, id]
    SqlRunner.run(sql, values)
  end

  def peak_time()
    if ["07:00:00", "08:00:00", "09:00:00", "17:00:00", "18:00:00", "19:00:00", "20:00:00"].include?(@class_time)
      return true
    else
      return false
    end
  end

  def members_attending()
    results = self.members()
    return results.length().to_i
  end

  def capacity_check()
    if self.members_attending() < self.max_capacity()
      return true
    else
      return false
    end
  end

  def all_available_members
    sql = "SELECT * FROM members WHERE id NOT IN (SELECT member_id FROM reservations WHERE gym_class_id = $1)"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def available_premium_members()
    sql = "SELECT * FROM members WHERE id NOT IN (SELECT member_id FROM reservations WHERE gym_class_id = $1) and membership_type = $2"
    values = [@id, "Premium"]
    results = SqlRunner.run(sql, values)
    return results.map {|member| Member.new(member)}
  end

  def available_members()
    if self.peak_time() == true
      return self.available_premium_members
    else
      return self.all_available_members
    end
  end
end
