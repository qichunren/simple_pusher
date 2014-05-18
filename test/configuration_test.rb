require File.expand_path("../test_helper", __FILE__)

describe SimplePusher::Configuration do
  it "must respond to debug method" do
    configuration = SimplePusher::Configuration.new
    configuration.debug.must_equal false #default to false
  end

  it "must respond to port method" do
    configuration = SimplePusher::Configuration.new
    configuration.port.must_equal 8088 #default to 8088
  end

end