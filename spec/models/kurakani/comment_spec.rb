require 'spec_helper'

describe Kurakani::Comment do
  
  subject { Kurakani::Comment.create!(:content => "**A bold comment**", :user => create(:user), 
                :commentable => Post.create!(:title => "The post title", :content => "The post content")) }
  
  context "should respond to" do  
    it "commentable_type, commentable_id" do
      subject.respond_to?(:commentable_id).should be_true
      subject.respond_to?(:commentable_type).should be_true
    end
  end
  
  context "with markdown syntax" do
    it "should convert the markdown syntax comment to html" do
      subject.rendered_content.strip.should eql("<p><strong>A bold comment</strong></p>")
    end
    it "should show the syntax highlighted html" do
text = <<-code
Look at the documentation.

```ruby
def some_func(param={})
  puts "something"
end
```
Checkout the code.
code

      comment = Kurakani::Comment.create!(:content => text, :user => create(:user), 
                    :commentable => Post.create!(:title => "The post title", :content => "The post content"))
      comment.reload
      
expected_text = <<-code
<p>Look at the documentation.</p>
<pre><code class="ruby">
def some_func(param={})
  puts "something"
end
</code></pre>
<p>Checkout the code.</p>
code

      comment.rendered_content.gsub(/\r+/,"").gsub(/\n+/,"").should eq(expected_text.gsub(/\r+/,"").gsub(/\n+/,""))
    end
  end
end
