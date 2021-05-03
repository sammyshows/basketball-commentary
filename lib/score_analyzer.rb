# frozen_string_literal: true

require 'json'

class ScoreAnalyzer
  def initialize(api_key)
    @api_key = api_key
  end

  def analyze
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI('https://free-nba.p.rapidapi.com/games?page=0')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-key'] = @api_key
    request['x-rapidapi-host'] = 'free-nba.p.rapidapi.com'

    response = http.request(request)
    game_count = JSON.parse(response.read_body)['data'].length
    "#{game_count} games"
  end
end
