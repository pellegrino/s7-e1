module RubyAck
  module Option
    class BaseOption
      attr_accessor :command
    end

    # Represents each available option
    class OptionFactory
      attr_accessor :commands

      def initialize
        @commands = []
      end

      def ignore_directories(dir)
        @commands << IgnoreDirectories.new(dir)
      end

      def command
        @commands.join " "
      end
    end
  end
end

require_relative 'options/ignore_directories'
