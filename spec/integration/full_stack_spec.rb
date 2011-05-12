require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe RubyAck do

  before { @rubyack = RubyAck::Core.new }

  it "should run ack"  do
    @rubyack.search("foo").should be_true
  end

  it "should be able to ignore directories" do
    @rubyack.search("foo") do |s|
      s.ignore_directory "spec/integration/fixtures"
    end.should_not be_true
  end
end
