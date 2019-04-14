require_relative('../db/sql_runner.rb')
require_relative('gym_class.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :membership_type, :membership_number#, :membership_start_date, :membership_renewal_date

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
    @membership_type = details['membership_type']
    # @membership_number = details['membership_number'].to_i if details['membership_number']
    # @membership_start_date = details['membership_start_date']
    # @membership_renewal_date = details['membership_renewal_date']
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name, membership_type)
          VALUES ($1, $2, $3)
          RETURNING id"
    values = [@first_name, @last_name, @membership_type]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map{ |member| Member.new(member) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Member.new(result)
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM members WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE members
    SET (first_name, last_name, membership_type)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @membership_type, @id]
    SqlRunner.run(sql, values)
  end

  def attending_classes()
    sql = "SELECT classes.* FROM classes
    INNER JOIN reservations ON reservations.gym_class_id = classes.id
    WHERE reservations.member_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gym_class| GymClass.new(gym_class) }
  end

  def reservations
    sql = "SELECT * FROM reservations WHERE reservations.member_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |reservation| Reservation.new(reservation) }
  end

  def remove_reservations()
    sql = "DELETE FROM reservations WHERE reservations.member_id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



end
