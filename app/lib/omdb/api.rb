module Omdb
  class Api
      def self.search_movies_by_name(q)
        begin
          url = "http://www.omdbapi.com/?&apikey=106730c6&s=#{q}"
          uri = URI(url)
          response = HTTP.get(uri)
          parsed_response = JSON.parse(response)
          parsed_response = parsed_response["Search"]
        rescue StandardError => e
          Rails.logger.error("#{self.class.name}.#{__method__} Exception: #{e.message} #{e.backtrace}")
          return false
        end
      end
  end
end