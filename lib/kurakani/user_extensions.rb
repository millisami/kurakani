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

# module Cornerstone
# 
#   module ActsAsCornerstoneUser
# 
#     extend ActiveSupport::Concern
# 
#     included do
#       userclass = self.name
# 
#       # == Associations
#       has_many :cornerstone_discussions, :foreign_key => :user_id,
#                                          :class_name => "::Cornerstone::Discussion"
#       has_many :cornerstone_posts, :foreign_key => :user_id,
#                                    :class_name => "::Cornerstone::Post"
# 
#       # TODO: dependent destroy? - how to handle when user account deleted?
#       #                          - perhaps this can be an option specified in initializer
# 
#       # == Accessibility
#       cattr_accessor :cornerstone_name_method, :cornerstone_email_method,
#                      :cornerstone_admin
# 
#       # TODO: Might need support for multiple user models such as AdminUser... etc.
#       # send belongs_to user relationships
#       Cornerstone::Discussion.send(:belongs_to, :user, :class_name => userclass)
#       Cornerstone::Post.send(:belongs_to, :user, :class_name => userclass)
#     end
