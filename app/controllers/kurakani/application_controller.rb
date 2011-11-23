module Kurakani
  class ApplicationController < ::ApplicationController
    respond_to :html
    
    # helper_method :current_kurakani_user
    
    module KurakaniUtilities
      def kurakani_login_url        
        send(Kurakani::Engine.login_url)
      end
      
      def kurakani_current_user
        send(Kurakani::Engine.current_user)
      end
    end
    
    ActionView::Base.send(:include, KurakaniUtilities)
    # helper_method :kurakani_login_url
    
  end
end
