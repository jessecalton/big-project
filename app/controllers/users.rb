get '/users' do
  erb :'users/index'
end

get '/users/new' do 
  erb :'users/new'
end

post '/users' do 
  # creates the user
end

get '/users/:id' do 
  erb :'users/show'
end

