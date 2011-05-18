require 'spec_helper'


describe RubyAck::OptionParametersBuilder do

  before { @builder = RubyAck::OptionParametersBuilder.new }

  context "ignore directory" do
    it { @builder.ignore_directory('foo').should ==  ['--ignore-dirs foo'] }
  end
  context "non recursive" do
    it { @builder.non_recursive.should == ["--no-recurse"] }
  end

  context "following symlinks" do
    it { @builder.follow_symlink.should == [ "--follow" ] }
  end

end
