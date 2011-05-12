require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include Core

describe "Rubyack" do


  before { @text_searcher = TextSearcher.new }
  it 'should invoke ack' do
    @text_searcher.invoker.should_receive(:invoke).with("def foo")
    @text_searcher.search("def foo")
  end

  it "should be to return the lines found" do
    @text_searcher.invoker.stub!(:invoke).with("factory").and_return(["admission/robot/lib/factory.rb:3:  def initialize(map)\n"])
    lines = @text_searcher.search("factory")
    lines.size.should == 1

    first_result = lines.first
    first_result.number.should == 3
  end

  describe ResultsParser do
    it "should return an empty array if no result is found" do
      ResultsParser.parse([]).should be_empty
    end

    it "should parse a result with 1 line" do
      result_line = ResultsParser.parse(["admission/robot/lib/factory.rb:3:123:  def initialize(map)\n"]).first

      result_line.number.should == 3
      result_line.column.should. == 123
      result_line.text.should == "def initialize(map)"
      result_line.file.should == 'admission/robot/lib/factory.rb'
    end

    it "should be able to parse multiple results" do
      results = ResultsParser.parse(["admission/robot/lib/factory.rb:3:  def initialize(map)\n",
                                     "admission/travel/rdoc/Flight.html:363:50:   <span class=\"ruby-keyword kw\">def</span> <span class=\"ruby-identifier\">total_duration</span>\n"])
      results.size.should ==  2
    end

  end
end
