class OmdbService
  def call_service(prm)
    begin
      response = Omdb::Api.search_movies_by_name(prm)
      @movies = []
      if response
        response = response.sort_by { |h| h['Year']  }
        response.map do |movie|
          @movies.push(%W[#{movie["Title"]} #{movie["Year"]} #{movie["Poster"]}])
        end
      end
      @movies
    rescue StandardError => e
      Rails.logger.error("#{self.class.name}.#{__method__} Exception: #{e.message} #{e.backtrace}")
      return false
    end
  end
end