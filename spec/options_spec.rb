require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Option::OptionParametersBuilder do

  before { @builder = RubyAck::Option::OptionParametersBuilder.new }

  context "ignore directory" do
    it { @builder.ignore_directory('foo').should ==  ['--ignore-dirs foo'] }
  end
  context "non recursive" do
    it { @builder.non_recursive.should == ["--no-recurse"] }
  end
end
