module RubyAck
  module Option

    class NonRecursive < BaseOption

      def initialize
        @command = "--no-recurse"
      end

    end

  end
end
