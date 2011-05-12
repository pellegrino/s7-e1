module RubyAck
  module Core
    class TextSearcher
      attr_accessor :invoker

      def initialize
        @invoker = Invoker.new
      end

      def search(params)
        params = "\"#{params}\""

        if block_given?
          option_factory = Option::OptionFactory.new

          yield option_factory

          params += " " + option_factory.command
        end

        ResultsParser.parse @invoker.invoke(params)
      end
    end
  end
end

require_relative 'options'
require_relative 'core/invoker'
require_relative 'core/line'
require_relative 'core/results_parser'
