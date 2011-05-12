module RubyAck
  module Option
    class BaseOption
      attr_accessor :command

      def to_s
        @command
      end
    end

    # Represents each available option
    class OptionFactory
      attr_accessor :commands

      def initialize
        @commands = []
      end

      def ignore_directory(dir)
        @commands << IgnoreDirectory.new(dir)
      end

      def non_recursive
        @commands << NonRecursive.new
      end

      def command
        @commands.join " "
      end
    end
  end
end

require_relative 'options/ignore_directory'
require_relative 'options/non_recursive'
