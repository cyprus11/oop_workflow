require "spec_helper"
require_relative "../../task_1/data/ice_cream_factory"
require_relative "../../task_1/data/weather_predicter"

RSpec.describe IceCreamFactory do
  let(:ice_cream_factory) { IceCreamFactory.new(name: 'Soviet IceCream') }

  it "will create 20 quantity of ice cream" do
    allow(WeatherPredicter).to receive_message_chain(:new, :temperature_on_prediction).and_return(15)
    ice_cream_factory.produce!
    expect(ice_cream_factory.produced_goods.size).to eq(20)
  end

  it "will create 30 quantity of ice cream" do
    allow(WeatherPredicter).to receive_message_chain(:new, :temperature_on_prediction).and_return(31)
    ice_cream_factory.produce!
    expect(ice_cream_factory.produced_goods.size).to eq(30)
  end

  it "will create 10 quantity of ice cream" do
    allow(WeatherPredicter).to receive_message_chain(:new, :temperature_on_prediction).and_return(9)
    ice_cream_factory.produce!
    expect(ice_cream_factory.produced_goods.size).to eq(10)
  end
end