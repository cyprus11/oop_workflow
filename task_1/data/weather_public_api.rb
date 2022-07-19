require_relative "./weather_reporter.rb"
require_relative "./weather_api_service.rb"


class WeatherPublicApi < WeatherReporter
  def temperature
    temp = WeatherApiService.temperature({ lat: @latitude, lon: @longitude})
    if @temp_type == 'f'
      temp = temp * 9 / 5 + 32
    end

    temp
  end

  def temperature_on_date(date)
    temperature
  end
end