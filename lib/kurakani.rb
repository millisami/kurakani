require "kurakani/engine"
require "kurakani/user_extensions"

module Kurakani
  
  def make_commentable!
    include Commentable
  end
end

ActiveRecord::Base.extend Kurakani