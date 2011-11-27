Kurakani::Engine.login_url = :login_url
Kurakani::Engine.logout_url = :logout_url
Kurakani::Engine.unauthorized_url = :unauthorized_url

Kurakani::Engine.current_user = :current_user
Kurakani::Engine.user_name = :username

# :can_moderate_comments is a method that will be called on Kurakani::Engine.current_user for authorization
# should return Boolean true/false
Kurakani::Engine.can_moderate_comments = :can_moderate_comments?