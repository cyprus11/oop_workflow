require "spec_helper"
require_relative "../../task_1/data/weather_predicter"
require_relative "../../task_1/data/weather_random"

RSpec.describe WeatherPredicter do
  before do
    # @source = WeatherRandom.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'c')
    # allow(WeatherRandom.new(latitude: '11.1111', longitude: '22.2222', temp_type: 'c')).to receive(:temperature_on_date).and_return(15)
    # allow(WeatherRandom.new).to receive(:temperature_on_date).and_return(15)
    allow(WeatherPredicter).to receive_message_chain(:new, :temperature_on_prediction).and_return(15)
  end

  let(:average_temp) { WeatherPredicter.new(latitude: '11.1111', longitude: '22.2222', date: '2022-03-10', source: WeatherRandom, temp_type: 'c') }
  let(:median_temp) { WeatherPredicter.new(latitude: '11.1111', longitude: '22.2222', date: '2022-03-10', source: WeatherRandom, temp_type: 'c', prediction: :m) }

  it "return average value" do
    expect(WeatherPredicter.
      new(latitude: '11.1111', longitude: '22.2222', date: '2022-03-10', source: WeatherRandom, temp_type: 'c').
      temperature_on_prediction).to eq(Array.new(10, 15).sum / 10)
  end

  it "return median value" do
    expect(WeatherPredicter.
      new(latitude: '11.1111', longitude: '22.2222', date: '2022-03-10', source: WeatherRandom, temp_type: 'c', prediction: :m).
      temperature_on_prediction).to eq(Array.new(10, 15)[10 / 2])
  end
end