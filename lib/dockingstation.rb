require_relative 'bike'

  class DockingStation
    attr_reader :bike
    attr_accessor :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity=DEFAULT_CAPACITY)
      @bikes = []
      @capacity = capacity
    end

    def release_bike
      fail 'No bikes available' if empty?
      fail 'Cannot release broken bike' unless @bikes[-1].working?
      @bikes.pop
    end

    def dock_bike(bike)
      fail 'Docking station full' if full? #self
      @bikes << bike
    end

    private
      def full?
        @bikes.count >= capacity
      end

      def empty?
        @bikes.count == 0
      end
end
