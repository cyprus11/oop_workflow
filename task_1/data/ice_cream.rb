require "forwardable"
require_relative "packed_product"
require_relative "foil_package"

class IceCream < PackedProduct
  extend Forwardable
  def_delegators :@package, :open!, :open?

  attr_reader :cost, :package, :empty

  def initialize
    @cost = 0.7
    @package = FoilPackage.new
    @empty = false
  end

  def eat!
    raise if eat?
    raise unless open?
    @empty = true
  end

  def eat?
    @empty
  end
end