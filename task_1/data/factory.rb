class Factory
  attr_reader :produced_goods

  def initialize(name:)
    @name = name
    @produced_goods = []
  end

  def produce!(quantity:, product_class:)
    raise NotImplementedError
  end
end