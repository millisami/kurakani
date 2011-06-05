require 'spec_helper'

describe Kurakani::Comment do
  
  subject { Kurakani::Comment.new :content => "**A bold comment**" }
  
  context "should respond to" do  
    it "commentable_type, commentable_id" do
      subject.respond_to?(:commentable_id).should be_true
      subject.respond_to?(:commentable_type).should be_true
    end
  end
  
  context "with markdown syntax" do
    let(:comment) { Kurakani::Comment.create!(:content => "**A bold comment**", 
                  :commentable => Post.create!(:title => "The post title", :content => "The post content")) }

    it "should convert the markdown syntax comment to html" do
      comment.rendered_content.strip.should eql("<p><strong>A bold comment</strong></p>")
    end
  end
end
