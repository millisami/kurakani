module Kurakani 
  module UserExtensions
    def self.included(base)
      Kurakani::Comment.belongs_to :user, :class_name => base.to_s
    end
  end
end