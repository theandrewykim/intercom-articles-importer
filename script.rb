require 'intercom'
require 'pry'


export_workspace = Intercom::Client.new(token: #ACCESS_TOKEN)
import_workspace = Intercom::Client.new(token: #ACCESS_TOKEN)
imported_collection_name = #NAME_OF_COLLECTION

collection = import_workspace.collections.create(name: imported_collection_name)
collection_id = collection.id
author_id = #ADMIN_ID

exported_articles = export_workspace.articles.all

exported_articles.each do |export_article|
    if export_article.state == "published"
       imported_article = import_workspace.articles.create({
            title: export_article.title, 
            body: export_article.body,
            parent_type: "collection", 
            parent_id: collection.id,
            state: "draft",
            author_id: author_id
        })
        print "\n Copying Article #{imported_article.title}"
    end
    "All done! Check out your Articles in Intercom!"
end

