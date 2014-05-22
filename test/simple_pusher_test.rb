require File.expand_path('../test_helper', __FILE__)

describe SimplePusher do

  it 'must respond version method' do
    SimplePusher::VERSION.wont_be_nil
  end

  it 'setup method work' do
    # EventMachine.run do
    #
    # end
    SimplePusher.setup do |c|
      c.port = 8888
    end
    SimplePusher.configuration.port.must_equal 8888
  end

end
