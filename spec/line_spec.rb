require 'spec_helper'


describe RubyAck::Line do
  before do
    @line = RubyAck::Line.new :number => 5,
                     :text => "def defend_against(self)",
                     :file => "monster.rb",
                     :column => 14
  end
  it "should have a number" do
    @line.number.should == 5
  end

  it "should have a text" do
    @line.text.should == "def defend_against(self)"
  end

  it "should have a file" do
    @line.file.should == "monster.rb"
  end

  it "should have a column" do
    @line.column.should == 14
  end

end
