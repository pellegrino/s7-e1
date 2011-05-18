require 'spec_helper'

describe RubyAck::Invoker do

  it "should invoke ack with --column as a default for the given parameter" do
    IO.should_receive(:popen).with("ack jackpot --column")

    invoker = RubyAck::Invoker.new
    invoker.invoke("jackpot")
  end
end
