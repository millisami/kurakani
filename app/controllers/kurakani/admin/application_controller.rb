module Kurakani
  class Admin::ApplicationController < ::ApplicationController
    authorize_kurakani_admin!
    
  end
end