require 'spec_helper'

describe Kurakani::Comment do
  
  let(:post) { Post.create!(:title => "First Post", :content => "The content of the post") }
  
  context "unauthenticated user" do
    it "cannot see the new comment header" do
      visit post_path(post)
      page.should_not have_content("New Comment")
      page.should have_content("Login to comment")
    end
    
    it "redirect to login url" do
      visit post_path(post)
      click_link "Login to comment"
      page.current_url.should eql(send(Kurakani::Engine.login_url))
    end
  end

  context "authenticated user" do
    let(:user) { create(:user, username: "sachin") }
    
    before do
      login_as(user)
    end
    
    it "creating a new comment" do
      post.title.should eql("First Post")
  
      visit post_path(post)

      fill_in "Your comment", :with => "First comment"
      click_button "Create"
  
      within "#flash_notice" do 
        page.should have_content("Comment has been created!")
      end
  
      within "#comments" do
        page.should have_content("First comment")
      end
      Kurakani::Comment.count.should eql(1)
    end
    
  end
  
end
