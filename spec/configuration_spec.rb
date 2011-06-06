require 'spec_helper'

describe "required configuration options must be set" do 
  
  required_options = [:current_user, :login_url, :logout_url, :unauthorized_url, :can_moderate_comments, :user_name]
  
  required_options.each do |option|
    it "requires #{option} is set" do 
      Kurakani::Engine.send("#{option}=", nil) 
      option_call = lambda { Kurakani::Engine.send(option) } 
      
      option_call.should raise_error(Kurakani::Engine::ConfigurationNotFound, 
            "Kurakani configuration option #{option} not found. Please set this in config/initializers/kurakani.rb")
      
      Kurakani::Engine.send("#{option}=", "not nil")
      option_call.should_not raise_error 
    end
  end
end