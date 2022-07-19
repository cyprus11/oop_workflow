require "spec_helper.rb"
require_relative "../../task_1/data/weather_reporter.rb"

RSpec.describe WeatherReporter do
  let(:reporter) { WeatherReporter.new(latitude: '11.111', longitude: '22.222', temp_type: 'some type') }

  it 'raise a NotImplementedError' do
    expect { reporter.temperature }.to raise_error(NotImplementedError)
    expect { reporter.temperature_on_date('2022-03-10') }.to raise_error(NotImplementedError)
  end
end