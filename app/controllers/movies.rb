get '/movies' do
  erb :'/movies/new'
end

post '/movies' do 
  p params
  @movie_search = params[:search]
  @results = MovieSearch.new.find_movie(@movie_search)
  p @results
  redirect '/movies'
end