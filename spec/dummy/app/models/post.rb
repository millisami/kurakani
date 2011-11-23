class Post < ActiveRecord::Base
  make_commentable
  # include Kurakani::Commentable
end
