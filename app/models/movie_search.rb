class MovieSearch
  include HTTParty
  base_uri 'http://www.omdbapi.com/?t='

  def initialize(title)
    movie_url = title.gsub(/\s+/, "+")
    uri = URI.parse("http://www.omdbapi.com/?t=#{movie_url}")
    uri.open {|f| @movie_data = self.class.get(uri) }
    
  end

  def movie_data_parse
    ap @movie_data["Year"] ## This works!!!
    
  end
  # def questions
  #   self.class.get("/2.2/questions", @options)
  # end

  # def users
  #   self.class.get("/2.2/users", @options)
end