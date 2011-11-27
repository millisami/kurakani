module Kurakani # :nodoc:
  module Helpers
    def kurakani_list(*args)
      @commentable = args.shift
      
      # @comments = commentable.comments
      # FIX: The above code should work with the association defined.
      # But its weired that it throws the error=> uninitialized constant Post::Comment
      # So, getting comments via customized query
      
      @comments = Kurakani::Comment.where(:commentable_id => @commentable.id, :commentable_type => @commentable.class.to_s)
      
      # render a comment form
      render :partial => "kurakani/comments/form", :locals => {:commentable => @commentable, :comments => @comments}
    end
  end
end