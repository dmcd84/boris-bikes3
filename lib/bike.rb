class Bike
  def initialize
    @bike_working = true
  end

  def report_broken
    @bike_working = false
  end

  def working?
    @bike_working
  end
end
