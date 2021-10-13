class ArticleCollection < Array
    def fix_redirects
        self.each do |article| 
            article.transform_anchors
            article.update_imported_article
        end
    end
end