require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :membership_type, :membership_number#, :membership_start_date, :membership_renewal_date

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
    @membership_type = details['membership_type']
    @membership_number = details['id'] += 1110
    # @membership_start_date = details['membership_start_date']
    # @membership_renewal_date = details['membership_renewal_date']
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name, membership_type, membership_number)
          VALUES ($1, $2, $3, $4)
          RETURNING id"
    values = [@first_name, @last_name, @membership_type, @membership_number]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()


end
