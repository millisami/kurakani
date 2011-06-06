require 'spec_helper'

describe "comments" do 
  
  let(:post) { Post.create!(:title => "First Post", :content => "The content of the post") }
  
  it "creating a new comment" do
    post.title.should eql("First Post")
    
    visit post_path(post)
    save_and_open_page
    fill_in "Content", :with => "First comment"
    click_button "Create"

    within "#flash_notice" do 
      page.should have_content("Comment has been created!")
    end

    within "#comments" do
      page.should have_content("First comment")
    end
  end
end
