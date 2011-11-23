RSpec.configure do |c| 
  c.before(:each) do
    Kurakani::Engine.user_name = :login
    Kurakani::Engine.current_user = :current_user
    
    Kurakani::Engine.login_url = :login_url
    Kurakani::Engine.logout_url = :logout_url
    Kurakani::Engine.unauthorized_url = :unauthorized_url

    Kurakani::Engine.can_moderate_comments = :can_moderate_comments
  end
end