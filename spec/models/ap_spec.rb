require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ap do
  before(:each) do
    @ap = Ap.new
  end

  it "should be valid" do
    @ap.should be_valid
  end
end
