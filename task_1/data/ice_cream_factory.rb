require_relative "factory"
require_relative "ice_cream"
require_relative "weather_predicter"

class IceCreamFactory < Factory
  def produce!(quantity: 20, product_class: IceCream, date: nil)
    raise unless product_class == IceCream
    temp = WeatherPredicter.new(latitude: '11.1111', longitude: '22.2222', date: date, source: WeatherRandom, temp_type: 'c').temperature_on_prediction

    @produced_goods = if temp > 30
      Array.new(quantity * 1.5) { IceCream.new }
    elsif temp < 10
      Array.new(quantity / 2) { IceCream.new }
    else
      Array.new(quantity) { IceCream.new }
    end
  end
end