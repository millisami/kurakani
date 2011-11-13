module Kurakani # :nodoc:
  module Helpers
    def kurakani_list(*args)
      # TODO
      # Check and delete the options in .slice(:small, :remote_options)
      # options = args.extract_options!.to_hash.symbolize_keys.slice(:small, :remote_options)

      # remote_options = options.delete(:remote_options) || {}
      @commentable = args.shift
      
      # @comments = commentable.comments
      # FIX: The above code should work with the association defined.
      # But its weired that it throws the error=> uninitialized constant Post::Comment
      # So, getting comments via customized query
      
      @comments = Kurakani::Comment.where(:commentable_id => @commentable.id, :commentable_type => @commentable.class.to_s)
      
      # debugger
      
      all_comments = @comments.each do |comment|
        div_for(comment) do
          content_tag(:h4, comment.user.send(Kurakani::Engine.user_name).title)
          simple_format(comment.rendered_content)
        end
      end

      # render a comment form
      comment_form = render :partial => "kurakani/comments/form", :locals => {:commentable => @commentable}
            
      if @comments.present?
        (comment_form + all_comments).html_safe
      else
        comment_form.html_safe
      end
      
    end
  end
end

::ActionView::Base.send(:include, Kurakani::Helpers) # :nodoc: