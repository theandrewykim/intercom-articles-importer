require 'intercom'
require 'pry'


export_workspace = Intercom::Client.new(token: #ACCESS_TOKEN)
import_workspace = Intercom::Client.new(token: #ACCESS_TOKEN)
imported_collection_name = #COLLECTION_NAME

collection = import_workspace.collections.create(name: imported_collection_name)
collection_id = collection.id
author_id = #AUTHOR_ID
failed_articles = []
exported_articles = export_workspace.articles.all

exported_articles.each do |export_article|
    
    if export_article.state == "published"
        begin 
            imported_article = import_workspace.articles.create({
                title: export_article.title, 
                body: export_article.body,
                parent_type: "collection", 
                parent_id: collection.id,
                state: "draft",
                author_id: author_id
            })
            print "\n Copying Article #{imported_article.title}"
        rescue
            print "\nFailed to import article...moving on"
            failed_articles << export_article.title
         end
    end
end

print "\n All done! Check out your Articles in Intercom!"
print "\n Here are the titles of the Article(s) that I couldn't copy: #{failed_articles}. Please check if there's any wonky formatting in said Article(s)"

