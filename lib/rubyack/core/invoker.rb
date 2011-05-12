module RubyAck
  class Invoker
    def invoke(ack_string)
      # puts "      io = IO.popen(ack #{ack_string} --column)"
      io = IO.popen("ack #{ack_string} --column")
      result= io.readlines
      io.close
      result
    end
  end
end
