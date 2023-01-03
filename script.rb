require './init.rb'


ArticleImporter.import
articles = ObjectSpace.each_object(ArticleCollection).first
articles.fix_redirects if REPLACE_ARTICLE_URLS
print "\n Finished changing help center references to the URLs of your new Articles!" if REPLACE_ARTICLE_URLS

