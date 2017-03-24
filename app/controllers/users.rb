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
    @movie_array
    p @searched_params
    erb :'users/show'
  else
    redirect '/'
  end
end

post '/users/:id' do
  @searched_params = params[:runtime]
  @movie_array = []
  if current_user
    current_user.movies.each do |movie|
      searched_movie = MovieSearch.new(movie.title)
      if searched_movie.movie_time.to_i < @searched_params.to_i
        @movie_array << movie.title
      end
    end
    @movie_array
    @searched_params
    erb :'users/show'
    # redirect "/users/#{current_user.id}"
  else 
    erb :'users/show'
  end
  


end

