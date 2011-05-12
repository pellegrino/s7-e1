require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include RubyAck::Option # saves your fingers from extra typing

describe IgnoreDirectories do

  it 'should have --ignore_dirs as its command' do
    ignore_directory = IgnoreDirectories.new("foo")
    ignore_directory.command.should == '--ignore-dirs foo'
  end

end
