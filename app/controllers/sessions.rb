get '/sessions' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])
  @password_attempt = params[:user][:password]
  if @user.authenticate(@password_attempt)
    login(@user)
    redirect "/restaurants" # redirect to the home page
  else
    @errors = ['Wrong email or password']
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  logout
  redirect '/'
end