require 'spec_helper'

describe Kurakani::Comment do
  
  let(:post) { Post.create!(:title => "First Post", :content => "The content of the post") }
  
  context "unauthenticated user" do
    before do
      sign_out!
    end
    
    it "cannot see the new comment header" do
      visit post_path(post)
      page.should_not have_content("New Comment")
    end
    
    it "redirect to login url" do
      visit post_path(post)
      click_link "Login to comment"
      page.current_url.should eql(send(Kurakani::Engine.login_url))
    end
  end

  # context "authenticated user" do
  #   before do
  #     sign_in!
  #   end
  #   
  #   it "creating a new comment" do
  #     post.title.should eql("First Post")
  # 
  #     visit post_path(post)
  #     fill_in "Your comment", :with => "First comment"
  #     click_button "Create"
  # 
  #     within "#flash_notice" do 
  #       page.should have_content("Comment has been created!")
  #     end
  # 
  #     within "#comments" do
  #       page.should have_content("First comment")
  #     end
  #     Kurakani::Comment.count.should eql(1)
  #   end
  #   
  #   it "not authorized user cannot moderate comment" do
  #     visit 
  #     page.current_url.should eql(send(Kurakani::Engine.unauthorized_url))
  #     
  #   end
  # end
  # 
  # xit "show a single page" do
  #   cms_page = MeroCms::Page.create!(:title => "About Us", :content => "The about us content.")
  # 
  #   visit page_path(cms_page)
  #   within "#page h2" do
  #     page.should have_content("About Us")
  #   end
  #   within "#page .mero_cms_page" do
  #     page.should have_content("The about us content.")
  #   end
  # end
  # 
  # context "authenticated and authorized user" do
  #   before do
  #     sign_in_as_authorized!
  #   end
  #   it "creating a new comment" do
  #     post.title.should eql("First Post")
  # 
  #     visit post_path(post)
  #     fill_in "Content", :with => "First comment"
  #     click_button "Create"
  # 
  #     within "#flash_notice" do 
  #       page.should have_content("Comment has been created!")
  #     end
  # 
  #     within "#comments" do
  #       page.should have_content("First comment")
  #     end
  #   end
  # 
  #   xit "edit a page" do
  #     cms_page = MeroCms::Page.create!(:title => "About Us", :content => "The about us content.")
  # 
  #     visit page_path(cms_page)
  #     click_link "Edit"
  # 
  #     fill_in "Title", :with => "Contact Us"
  #     fill_in "Content", :with => "Following is the contact us info"
  #     click_button "Update Page"
  # 
  #     within "p#flash_notice" do
  #       page.should have_content("Page updated!")
  #     end
  # 
  #     within "#page h2" do
  #       page.should have_content("Contact Us")
  #     end
  # 
  #     within "#page .mero_cms_page" do
  #       page.should have_content("Following is the contact us info")
  #     end
  #   end
  # 
  #   xit "destroy a page" do
  #     cms_page = MeroCms::Page.create!(:title => "About Us", :content => "The about us content.")
  # 
  #     visit page_path(cms_page)
  #     click_link "Destroy"
  #     within "p#flash_notice" do
  #       page.should have_content("Page destroyed!")
  #     end
  #   end    
  # end
end
