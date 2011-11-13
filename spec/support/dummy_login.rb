def sign_out!
  ApplicationController.class_eval <<-STRING
    def current_user
      nil
    end
    helper_method :current_user
  STRING
end

def sign_in!(options={})
  ApplicationController.class_eval <<-STRING
    def current_user
      user = User.find_or_create_by_login("kurakani_user")
      user.stubs(:can_moderate_comments).returns(false)
      user
    end
    helper_method :current_user
  STRING
end

def sign_in_as_authorized!(options={})
  ApplicationController.class_eval <<-STRING
    def current_user
      user = User.find_or_create_by_login("kurakani_user")
      user.stubs(:can_moderate_comments).returns(true)
      user
    end
    helper_method :current_user
  STRING
end