module RubyAck
  class Invoker
    def invoke(ack_string)
      io = IO.popen("ack #{ack_string} --column")
      result= io.readlines
      io.close
      result
    end
  end
end
