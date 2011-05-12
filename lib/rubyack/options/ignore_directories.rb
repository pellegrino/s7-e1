module RubyAck
  module Option
    class IgnoreDirectories < BaseOption
      def initialize(dir)
        @command = "--ignore-dirs #{dir}"
      end
    end
  end
end
