require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RubyAck do

  before { @rubyack = RubyAck::TextSearcher.new }

  it "should be able to search in a non recursive way" do
    @rubyack.search("def foo").should_not be_empty

    @rubyack.search("def foo") do |s|
      s.non_recursive
    end.should be_empty
  end

  it "should be able to ignore directories" do
    @rubyack.search("def non_existing_nowhere_else_method_name_than_here").should_not be_empty

    @rubyack.search("def non_existing_nowhere_else_method_name_than_here") do |s|
      s.ignore_directory "spec"
      s.ignore_directory "app"
    end.should be_empty
  end

  # for more information about these results, check fixtures/
  # directory
  context "using the ivory tower repository as a fixture" do
    before do
      @lines = @rubyack.search('defend_against') do |s|
        s.ignore_directory "spec"
      end
    end

    it "should find 3 results" do
      @lines.size.should == 3
    end
    context "and each line" do
      before do
        @line1, @line2, @line3 = @lines
      end
      it "should have its number parsed correctly" do
        @line1.number.should == 14
        @line2.number.should == 20
        @line3.number.should == 17
      end
      it "should have its column parsed correctly" do
        @line1.column.should == 11
        @line2.column.should == 17
        @line3.column.should == 30
      end
      it "should have its text parsed correctly" do
        @line1.text.should == 'def defend_against(tower)'
        @line2.text.should == 'monster.defend_against(self)'
        @line3.text.should == "enemy = mock(\"Monster\","
      end
      it "should have its file name parsed correctly" do
        @line1.file.should == 'fixtures/ivory_tower/lib/ivory_tower/monsters/blind_mouse.rb'
        @line2.file.should == 'fixtures/ivory_tower/lib/ivory_tower/towers/arrow_tower.rb'
        @line3.file.should == 'fixtures/ivory_tower/test/towers/arrow_tower_test.rb'
      end
    end
  end

end
