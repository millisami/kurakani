module Kurakani
  class Comment < ActiveRecord::Base
    
    belongs_to :commentable, :polymorphic => true
    
    # belongs_to :user
    # The above association is dynamically created in user_extensions module
    
    markdownize! :content
    
  end
end
