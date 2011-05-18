module RubyAck
  class Invoker
    def invoke(ack_string)
      IO.popen("ack #{ack_string} --column") { |io| io.readlines }
    end
  end
end
