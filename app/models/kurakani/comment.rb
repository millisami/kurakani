module Kurakani
  class Comment < ActiveRecord::Base
    belongs_to :commentable, :polymorphic => true
        
    # TODO
    # Kurakani::Comment.belongs_to :user, :class_name => base.to_s
    
    markdownize! :content
    
  end
end
