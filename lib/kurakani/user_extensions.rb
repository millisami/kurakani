module Kurakani 
  module UserExtensions
    extend ActiveSupport::Concern

    included do
      userclass = self.name

      # == Associations
      has_many :comments, :foreign_key => :user_id, :class_name => "::Kurakani::Comment"
      
      Kurakani::Comment.send(:belongs_to, :user, :class_name => userclass)
    end    
  end
end
