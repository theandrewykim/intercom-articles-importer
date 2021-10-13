EXPORT_ACCESS_TOKEN = "dG9rOjhlZWE4ZTRmXzRjYzlfNGVhY19iMjQ2X2U2NTIxNmI4OTU5NjoxOjA="
IMPORT_ACCESS_TOKEN = "dG9rOjA1ZWE4MDcxXzhiMmVfNGVlMF9hMjFlXzQ5ODY2ODY2YzJhYToxOjA="
COLLECTION_NAME = "last one?????"
AUTHOR_ID = 708351


#If you need to change URLS within your Articles that point to your old Helpcenter, fill in these fields. Otherwise, leave blank.
REPLACE_ARTICLE_URLS = true
EXPORT_CUSTOM_DOMAIN = "docs.intercom.com"
IMPORT_CUSTOM_DOMAIN = "crocks.intercom.com"

#commandthatexports-importsarticles
#List all articles that need to be published
#if needs to be copied -- create an ArticleIndex object. This will contain both the import_id AND the export_id



require 'intercom'
require 'nokogiri'
require 'mutations'
require 'pry'
require './fix_redirects.rb'
require './article.rb'
require './article_collection.rb'
require './article_importer.rb'


ExportWorkspace = Intercom::Client.new(token: EXPORT_ACCESS_TOKEN)
ImportWorkspace = Intercom::Client.new(token: IMPORT_ACCESS_TOKEN)
Collection = ImportWorkspace.collections.create(name: COLLECTION_NAME)
