require_relative 'options'
require_relative 'invoker'
require_relative 'line'
require_relative 'results_parser'

module RubyAck
  class TextSearcher
    attr_accessor :invoker

    def initialize
      @invoker = Invoker.new
    end

    def search(params)
      params = "\"#{params}\""

      if block_given?
        builder = OptionParametersBuilder.new

        yield builder

        params += " " + builder.command
      end

      ResultsParser.parse @invoker.invoke(params)
    end
  end

end
