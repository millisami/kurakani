module Kurakani
  module Commentable

    def self.included(base)
      base.extend ClassMethods
    end

    
    # included do |base|
    #   # debugger
    #   # base.class_eval do
    #     base.has_many :comments, :as => :commentable
    #   # end
    # end
    
    module ClassMethods
      def make_commentable
        has_many :comments, :as => :commentable
      end
    end
    
    # module InstanceMethods
    # end
  end
end

class ActiveRecord::Base
  include Kurakani::Commentable
end