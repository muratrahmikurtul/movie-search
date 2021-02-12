class OmdbService
  def call_service(prm)
    response = Omdb::Api.search_movies_by_name(prm)
    @movies = []
    if response
      response = response.sort_by { |h| h['Year']  }
      response.map do |movie|
        @movies.push(%W[#{movie["Title"]} #{movie["Year"]} #{movie["Poster"]}])
      end
    end
    @movies
  end
end