RSpec.configure do |c| 
  c.before(:each) do
    Kurakani::Engine.user_name = :login
    Kurakani::Engine.current_user = :current_user
  end
end