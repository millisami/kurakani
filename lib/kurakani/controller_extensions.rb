module Kurakani
  module ControllerAdditions
    extend ActiveSupport::Concern
    
    included do
      helper_method :kurakani_login_url, :kurakani_current_user
    end
    
    module InstanceMethods
      def kurakani_login_url
        send(Kurakani::Engine.login_url)
      end
    
      def kurakani_current_user
        send(Kurakani::Engine.current_user)
      end
    end
    
    module ClassMethods
      # Returns true if the user is authorized for moderating comments, otherwise
      # raise error
      def authorize_kurakani_admin!(*args)
        self.before_filter(*args) do |controller|
          raise Kurakani::AccessDenied unless kurakani_admin?
        end
      end
    end
    
  end
  
  ActionController::Base.send(:include, Kurakani::ControllerAdditions)
  
end
