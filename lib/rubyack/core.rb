module RubyAck
  class Core
    attr_accessor :invoker

    def initialize
      @invoker = Invoker.new
    end

    def search(params)
      if block_given?
        option_factory = OptionFactory.new
        yield option_factory
        params += option_factory.command
      end

      @invoker.invoke(params)
    end

  end

  class Invoker
    def invoke(ack_string)
      system('ack', ack_string)
    end
  end
end

