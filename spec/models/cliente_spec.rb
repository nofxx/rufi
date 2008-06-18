require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cliente do
  before(:each) do
    @cliente = Cliente.new
  end

  it "should be valid" do
    @cliente.should be_valid
  end
end
