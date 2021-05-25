# frozen_string_literal: true

require 'json'

class ScoreAnalyzer
  def initialize(api_key)
    @api_key = api_key
  end

  def game_details(game_index, attribute)
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://api-nba-v1.p.rapidapi.com/games/date/2021-05-23")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = @api_key
    request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'

    response = http.request(request)
    return JSON.parse(response.read_body)["api"]["games"][game_index][attribute]
  end
end

# score = ScoreAnalyzer.new('123')
# score.analyze
