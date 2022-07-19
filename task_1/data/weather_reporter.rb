# Abstract class
class WeatherReporter
  def initialize(latitude:, longitude:, temp_type:)
    @latitude = latitude
    @longitude = longitude
    @temp_type = temp_type
  end

  def temperature
    raise NotImplementedError
  end

  def temperature_on_date(date)
    raise NotImplementedError
  end
end