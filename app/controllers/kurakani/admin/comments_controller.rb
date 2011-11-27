module Kurakani
  class Admin::CommentsController < ApplicationController
    
    
    
    def index
      @comments = Kurakani::Comment.all
    end
  end
end