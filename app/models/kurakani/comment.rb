module Kurakani
  class Comment < ActiveRecord::Base
    
    belongs_to :commentable, :polymorphic => true
    
    belongs_to :user, :class_name => Kurakani::Engine.user_class.to_s.capitalize
    
    validates :content, :presence => true
    before_save :markdownize!
    
    private
    
    def markdownize!
      options = {:hard_wrap => true, :filter_html => true, :autolink => true, :no_intra_emphasis => true, :fenced_code_blocks => true, :space_after_headers => true}
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
      self.rendered_content = syntax_highlighter(markdown.render(self.content).html_safe)
    end

    def syntax_highlighter(html)
      doc = Nokogiri::HTML::DocumentFragment.parse(html)
      doc.search("//pre[@lang]").each do |pre|
        pre.replace Pygments.highlight(pre.text.rstrip, :lexer => pre[:lang].to_s)
      end
      doc.to_s
    end
        
  end
end
