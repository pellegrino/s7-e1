require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Rubyack" do

  it 'should invoke ack' do
    core = RubyAck::Core.new
    core.invoker.should_receive(:invoke).with("def foo")
    core.search("def foo")
  end
end
