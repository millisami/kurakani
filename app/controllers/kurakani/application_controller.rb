module Kurakani
  class ApplicationController < ::ApplicationController
    respond_to :html
    
    def current_kurakani_user
      send(Kurakani::Engine.current_user)
    end
    
    helper_method :current_kurakani_user
  end
end
