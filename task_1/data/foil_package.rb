require_relative "package"

class FoilPackage < Package
  def initialize
    @open = false
  end

  def open!
    @open = true
  end

  def open?
    @open
  end
end