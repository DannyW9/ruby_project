require ('sinatra')
require ('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all()
  erb (:"members/index")
end

get '/members/new' do
  erb(:"members/new")
end

get '/members/:id' do
  @member = Member.find_by_id(params['id'].to_i)
  erb (:"members/show")
end

post '/members' do
  @member = Member.new(params)
  @member.save()
  redirect '/members'
end

post '/members/:id/delete' do
  id = params[:id]
  Member.find_by_id(id).remove_reservations()
  Member.delete(id)
  redirect '/members'
end

get '/members/:id/edit' do
  id = params[:id]
  @member = Member.find_by_id(id)
  erb(:"members/edit")
end

post '/members/:id' do
  @member = Member.new(params)
  @member.update()
  redirect '/members'
end
