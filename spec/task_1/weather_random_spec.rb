require "spec_helper"
require_relative "../../task_1/data/weather_random"

RSpec.describe WeatherRandom do
  it "return temperature in celsium between -30 and 30" do
    expect(WeatherRandom.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'c').temperature).to be_between(-30, 30)
  end

  it "return temperature on date in celsium between -30 and 30" do
    expect(WeatherRandom.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'c').temperature_on_date('2022-03-10')).to be_between(-30, 30)
  end

  it "return temperature in fahrenheit between -30 and 30" do
    expect(WeatherRandom.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'f').temperature).to be_between(-22, 86)
  end

  it "return temperature on date in fahrenheit between -30 and 30" do
    expect(WeatherRandom.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'f').temperature_on_date('2022-03-10')).to be_between(-22, 86)
  end
end