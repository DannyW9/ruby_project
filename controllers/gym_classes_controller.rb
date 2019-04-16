require ('sinatra')
require ('sinatra/contrib/all')
require('pry')
require_relative('../models/gym_class.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/classes' do
  @classes = GymClass.all()
  erb(:"classes/index")
end

get '/classes/new' do
  erb(:"classes/new")
end

get '/classes/:id' do
  @class = GymClass.find_by_id(params[:id].to_i)
  @members = Member.all()
  @premium_members = Member.premium_members()
  erb (:"classes/show")
end

post '/classes' do
  @class = GymClass.new(params)
  @class.save()
  redirect '/classes'
end

post '/classes/:id/delete' do
  id = params[:id]
  GymClass.find_by_id(id).remove_reservations()
  GymClass.delete(id)
  redirect '/classes'
end

get '/classes/:id/edit' do
  id = params[:id]
  @class = GymClass.find_by_id(id)
  erb(:"classes/edit")
end

post '/classes/:id' do
  @class = GymClass.new(params)
  @class.update()
  redirect '/classes'
end
