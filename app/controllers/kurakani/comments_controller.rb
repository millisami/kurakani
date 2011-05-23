module Kurakani
  class CommentsController < ApplicationController
    def index
      @comments = Kurakani::Comment.all
    end
    def new
      @comment = Kurakani::Comment.new
    end
    
    def create
      @comment = Kurakani::Comment.create(params[:comment])
      flash[:notice] = "Comment has been created!"
      respond_with(@comment, :location => comments_path)
    end
  end
end
