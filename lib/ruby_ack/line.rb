module RubyAck
  class Line
    attr_accessor :number
    attr_accessor :text
    attr_accessor :file
    attr_accessor :column

    def initialize(params)
      @number = params[:number]
      @text   = params[:text]
      @file   = params[:file]
      @column = params[:column]
    end
  end

end
