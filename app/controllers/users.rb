get '/users' do
  p current_user
  erb :'users/index'
end

get '/users/new' do 
  erb :'users/new'
end

post '/users' do 
  # creates the user
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "/users/"
  else
    @errors = @user.errors
    erb :"/users/new"
  end
end

get '/users/:id' do 
  if current_user
    @current_user
    erb :'users/show'
  else
    redirect '/'
  end
end

