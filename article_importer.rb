module ArticleImporter

    def ArticleImporter.articles_to_export
        ExportWorkspace.articles.all
    end

    def ArticleImporter.import
        failed_articles = []
        article_collection = ArticleCollection.new
        exported_articles = ExportWorkspace.articles.all
        exported_articles.each do |exported_article|
            if exported_article.state == "published"
                begin 
                    imported_article = ImportWorkspace.articles.create({
                        title: exported_article.title, 
                        body: exported_article.body,
                        parent_type: "collection", 
                        parent_id: Collection.id,
                        state: "draft",
                        author_id: AUTHOR_ID
                    })
                    print "\n Copying Article #{imported_article.title}"
                    self.set_article_to_be_transformed(article_collection, exported_article.body, exported_article.id, imported_article.id) if REPLACE_ARTICLE_URLS
                rescue => error
                    print "\nFailed to import article (#{error.message}) ...moving on"
                    failed_articles << exported_article.title
                 end
            end
        end
        print "\n Importing done! Check out your Articles in Intercom!"
        print "\n Here are the titles of the Article(s) that I couldn't copy: #{failed_articles}. Please check if there's any wonky formatting in said Article(s)"
    end

    def ArticleImporter.set_article_to_be_transformed(article_collection, body, export_id, import_id)
        article_collection << Article.new(body, export_id, import_id)
    end
end
