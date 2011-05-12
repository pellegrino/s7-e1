module RubyAck
  module Option
    class IgnoreDirectory < BaseOption
      def initialize(dir)
        @command = "--ignore-dirs #{dir}"
      end
    end
  end
end
