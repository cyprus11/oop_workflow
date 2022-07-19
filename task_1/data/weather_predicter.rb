require "date"
require_relative "./weather_random"
require_relative "./weather_public_api"

class WeatherPredicter
  PREDICTION_METHODS = {
    a: 'average',
    m: 'median'
  }

  attr_accessor :prediction

  def initialize(latitude:, longitude:, date:, source: nil, temp_type: nil, prediction: :a)
    @latitude = latitude
    @longitude = longitude
    @date = date
    @source = source
    @temp_type = temp_type
    @prediction = prediction
  end

  def temperature_on_prediction
    public_send(PREDICTION_METHODS[@prediction])
  end

  def average
    sum = 0
    last_ten_years_dates_since_date.each do |date|
      sum += @source.new(latitude: @latitude, longitude: @longitude, temp_type: @temp_type).temperature_on_date(date)
    end

    sum / 10.0
  end

  def median
    temp_array = []
    last_ten_years_dates_since_date.each do |date|
      temp_array << @source.new(latitude: @latitude, longitude: @longitude, temp_type: @temp_type).temperature_on_date(date)
    end

    temp_array.compact!
    temp_array[temp_array.size / 2]
  end

  private

  def date
    @date.present? ? @date : Date.parse(@date).next_day.to_s
  end

  def last_ten_years_dates_since_date
    current_year = Time.parse(date).year
    years = ((current_year - 11)..current_year).to_a
    Array.new(10) { |index| date.gsub(current_year.to_s, years[index].to_s) }
  end
end