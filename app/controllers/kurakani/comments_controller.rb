module Kurakani
  class CommentsController < ApplicationController
    def index
      @comments = Kurakani::Comment.all
    end
    def new
      @comment = Kurakani::Comment.new
    end
    
    def create
      
      @commentable = find_commentable
      @comment = Kurakani::Comment.create(params[:comment].merge(:commentable_type => @commentable.class.to_s, :commentable_id => @commentable.id))
      flash[:notice] = "Comment has been created!"
      respond_with(@comment, :location => main_app.polymorphic_path(@commentable))
    end
    
    private
    def find_commentable
      params[:commentable_type].constantize.find(params[:commentable_id])
    end    
  end
end
