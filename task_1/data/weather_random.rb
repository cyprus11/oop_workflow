require_relative "./weather_reporter.rb"

class WeatherRandom < WeatherReporter
  def temperature
    temp = rand(-30..30)

    if @temp_type == 'f'
      temp = temp * 9 / 5 + 32
    end

    temp
  end

  def temperature_on_date(date)
    temperature
  end
end