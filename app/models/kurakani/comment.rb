module Kurakani
  class Comment < ActiveRecord::Base
    belongs_to :commentable, :polymorphic => true
    
    markdownize! :content
    
  end
end
