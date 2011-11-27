module SorceryCapybaraAuthHelpers
  def logout
    visit '/logout'
    page.should have_content("Logged out!")
  end

  def login_as(user)
    visit '/login'
    fill_in("username", :with => user.username)
    fill_in("password", :with => "secret")
    click_button("Log in")
    page.should have_content("Logged in!")
  end
end

RSpec.configure do |config|
  config.include SorceryCapybaraAuthHelpers, :type => :request
end