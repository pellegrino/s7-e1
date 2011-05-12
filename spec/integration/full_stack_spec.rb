require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Core

describe RubyAck do

  before { @rubyack = TextSearcher.new }

  it "should run ack"  do
    line = @rubyack.search("foo").first

    line.number.should == 1
    line.column.should == 5
    line.text == "foo"
    line.file == "spec/integration/fixtures/foo.rb"

  end

  it "should be able to ignore directories" do
    @rubyack.search("foo") do |s|
      s.ignore_directories "spec/integration/fixtures, spec/integration, spec/fubar"
    end.should be_empty
  end
end
