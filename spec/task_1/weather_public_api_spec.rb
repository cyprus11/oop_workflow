require "spec_helper"
require "json"
require_relative "../../task_1/data/weather_public_api.rb"

RSpec.describe WeatherPublicApi do
  before do
    allow(WeatherApiService).to receive(:temperature).and_return(20)
  end

  let(:temperature_c) { WeatherPublicApi.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'c') }
  let(:temperature_f) { WeatherPublicApi.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'f') }

  it 'returns temperature in celsium' do
    expect(temperature_c.temperature).to eq(20)
  end

  it 'returns temperature on date in celsium' do
    expect(temperature_c.temperature_on_date('2022-03-10')).to eq(20)
  end

  it 'returns temperature in fahrenheit' do
    expect(temperature_f.temperature).to eq(68)
  end

  it 'returns temperature on date in fahrenheit' do
    expect(temperature_f.temperature_on_date('2022-03-10')).to eq(68)
  end
end