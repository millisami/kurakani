module Kurakani
  module Commentable

    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def make_commentable
        has_many :comments, :as => :commentable
      end
    end
    
    module InstanceMethods
    end
  end
end

class ActiveRecord::Base
  include Kurakani::Commentable
end