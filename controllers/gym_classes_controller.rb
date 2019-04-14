require ('sinatra')
require ('sinatra/contrib/all')
require_relative('../models/gym_class.rb')
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
erb (:"classes/show")
end
