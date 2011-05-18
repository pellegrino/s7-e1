module RubyAck
  class ResultsParser
    def self.parse(results)
      return [] if results.nil? or results.empty?

      results.inject([]) { |lines, result | lines << self.parse_line(result) }
    end

    private
    def self.parse_line(line)
      file, number, column, text = line.split(/a*:/).each { |chunk| chunk.strip! }

      Line.new(:number => number.to_i,
               :text   => text,
               :column => column.to_i,
               :file   => file)
    end
  end
end
