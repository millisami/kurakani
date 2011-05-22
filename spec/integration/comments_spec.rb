require 'spec_helper'

describe "comments" do 
  it "creating a new comment" do
    visit comments_path
    fill_in "Content", :with => "First comment"
    click_button "Create Comment"

    within "#flash_notice" do 
      page.should have_content("Comment has been created!")
    end

    within "#comments .comment" do
      page.should have_content("First comment")
    end
  end
end
