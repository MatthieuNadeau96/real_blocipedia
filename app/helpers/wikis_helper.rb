module WikisHelper
    def user_is_authorized_for_wiki?(wiki)
        current_user && (current_user == wiki.user || current_user.admin?)
    end
    
    def markdown(text)
        extensions = [:tables, :fenced_code_blocks, :autolink, :strikethrough, :underline, :highlight, :quote, :footnotes]
        Markdown.new(text, *extensions).to_html.html_safe
    end
end
