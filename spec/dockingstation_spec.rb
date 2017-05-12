require "dockingstation.rb"

describe DockingStation do
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
  end
end

  describe '#dock_bike' do
    it 'raises an error when attempting to dock a bike in a full station' do
      subject.capacity.times { subject.dock_bike Bike.new }
      expect { subject.dock_bike Bike.new }.to raise_error 'Docking station full'
    end
  end

  it "releases working bikes" do
    #bike = subject.release_bike
    bike = Bike.new
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument}
  it { is_expected.to respond_to :bike}

  it 'docks something' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq @bikes
  end

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq @bikes
  end

  it 'returns docking station capacity' do
    dockingstation = DockingStation.new
    expect(dockingstation.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'should not release a broken bike' do
    my_bike = Bike.new
    my_bike.report_broken
    subject.dock_bike(my_bike)
    expect{subject.release_bike}.to raise_error "Cannot release broken bike" 
  end
end
