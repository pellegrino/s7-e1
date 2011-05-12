module RubyAck
  module Core
    class ResultsParser
      def self.parse(results)
        return [] if results.nil? or results.empty?

        lines = []
        results.each { |result| lines << self.parse_line(result) }

        lines
      end

      private
      def self.parse_line(line)
        file, number, column, text = line.split(/a*:/).each { |chunk| chunk.strip! }

        Line.new(:number => number.to_i,
                 :text => text,
                 :column => column.to_i,
                 :file => file)
      end
    end
  end
end
