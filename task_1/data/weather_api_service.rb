require 'uri'
require 'net/http'
require 'json'

class WeatherApiService
  API_KEY = ENV['WEATHER_API_KEY']

  def self.temperature(coordinates)
    uri = URI("https://api.weather.yandex.ru/v2/forecast?lat=#{coordinates[:lat]}&lon=#{coordinates[:lon]}&lang=ru-RU")
    response = Net::HTTP.get_response(uri, { 'X-Yandex-API-Key' => API_KEY })
    body = JSON.parse(response.body)
    response.code == 200 ? body['fact']['temp'].to_f : body['message']
  end
end