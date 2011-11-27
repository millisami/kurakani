class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include Kurakani::UserExtensions
  
  def can_moderate_comments?
    self.admin?
  end
end
