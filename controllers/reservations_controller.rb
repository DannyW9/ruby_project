require ('sinatra')
require ('sinatra/contrib/all')
require_relative('../models/reservation.rb')
require_relative('../models/gym_class.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/reservations' do
  @reservations = Reservation.all()
  erb(:"reservations/index")
end

get '/reservations/new' do
  @members = Member.all()
  @classes = GymClass.all()
  erb(:"reservations/new")
end

post '/reservations' do
  @reservation = Reservation.new(params)
  @reservation.save()
  redirect '/classes'
end

post '/reservations/:class_id/:member_id/delete' do
  class_id = params[:class_id]
  member_id = params[:member_id]
  GymClass.find_by_id(class_id).delete_by_id(member_id)
  redirect '/classes'
end
