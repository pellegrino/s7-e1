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

  it "should be able to search in a non recursive way" do
    @rubyack.search("def foo").should_not be_empty

    @rubyack.search("def foo") do |s|
      s.non_recursive
    end.should be_empty
  end

  it "should be able to ignore directories" do
    @rubyack.search("def non_existing_nowhere_else_method_name_than_here").should_not be_empty


    @rubyack.search("def non_existing_nowhere_else_method_name_than_here") do |s|
      s.ignore_directory "spec"
      s.ignore_directory "app"
    end.should be_empty
  end
end
