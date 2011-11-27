module Kurakani
  class Admin::CommentsController < Admin::ApplicationController
    
    respond_to :html
    
    def index
      @comments = Kurakani::Comment.all
    end
  end
end