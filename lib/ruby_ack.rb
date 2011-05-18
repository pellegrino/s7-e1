require_relative 'ruby_ack/text_searcher'
require_relative 'ruby_ack/options'
require_relative 'ruby_ack/line'
require_relative 'ruby_ack/invoker'
require_relative 'ruby_ack/results_parser'

# Backport require_relative to ruby 1.8
# stolen from: http://stackoverflow.com/questions/4333286/ruby-require-vs-require-relative-best-practice-to-workaround-running-in-both-r
unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
end
