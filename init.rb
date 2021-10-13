EXPORT_ACCESS_TOKEN = "YOUR ACCESS TOKEN"
IMPORT_ACCESS_TOKEN = "YOUR ACCESS TOKEN"
COLLECTION_NAME = "YOUR COLLECTION NAME"
AUTHOR_ID = "YOUR ADMIN ID"


#If you need to change URLS within your Articles that point to your old Helpcenter, fill in these fields. Otherwise, leave blank.
REPLACE_ARTICLE_URLS = true
EXPORT_CUSTOM_DOMAIN = "YOUR CUSTOM DOMAIN HERE"
IMPORT_CUSTOM_DOMAIN = "NEW CUSTOM DOMAIN HERE"

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
