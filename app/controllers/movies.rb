get '/movies/' do
  redirect '/movies/new'
end

get '/movies/new' do
  erb :'/movies/new'
end

post '/movies' do 

  @movie_search = params[:search]
  @results = MovieSearch.new(@movie_search)
  # p @results.movie_year ### This works!
  if @results.response != "False"
    p @results.response
    @new_movie = Movie.new(title: @results.movie_title)
    p @new_movie
    @new_movie.user_id = current_user.id
    @new_movie.save

    redirect "/movies/new"
  else
    @errors = ["You spelled the movie wrong"]
    erb :"/movies/new"
  end

end