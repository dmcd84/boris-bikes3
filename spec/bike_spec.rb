require "bike"

describe Bike do
  it { is_expected.to respond_to :working? }
  it "will respond to report broken" do
    expect(subject).to respond_to :report_broken
  end
  it "working method will return false when bike is reported as broken" do
    my_bike = Bike.new
    my_bike.report_broken
    expect(my_bike.working?).to eq false
  end
end
