module RubyAck
  # Builds the options string
  class OptionParametersBuilder
    attr_accessor :commands

    def initialize
      @commands = []
    end

    def ignore_directory(dir)
      @commands << "--ignore-dirs #{dir}"
    end

    def non_recursive
      @commands << "--no-recurse"
    end

    def follow_symlink
      @commands << "--follow"
    end

    def command
      @commands.join " "
    end
  end

end

