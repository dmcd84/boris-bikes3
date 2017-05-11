require_relative 'bike'

  class DockingStation
    attr_reader :bike

    def initialize
      @bikes = []
    end

    def release_bike
      fail 'No bikes available' if empty?
      @bikes.pop
    end

    def dock_bike(bike)
      fail 'Docking station full' if full? #self
      @bikes << bike
    end

    private
      def full?
        @bikes.count >= 20
      end

      def empty?
        @bikes.count == 0
      end
end
