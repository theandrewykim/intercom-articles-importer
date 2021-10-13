require './init.rb'

class Article
    attr_reader :export_id, :import_id, :articles_with_urls, :parsed_body
    attr_accessor :body

    include FixRedirects

    def initialize(body, export_id, import_id)
        @body = body
        @parsed_body = Nokogiri::HTML.parse(@body)
        @export_id = export_id
        @import_id = import_id
        @anchors = @parsed_body.xpath("//a")
    end

    def should_transform_urls?
        @anchors.each {|anchor| return true if anchor_is_a_help_center_reference?(anchor)}
    end

    def anchor_is_a_help_center_reference?(anchor)
        parsed_uri(anchor).host == EXPORT_CUSTOM_DOMAIN
    end

    def parsed_uri(anchor)
        URI(anchor[:href])
    end

    def update_imported_article
        @body = @parsed_body
        article = ImportWorkspace.articles.find(id: import_id)
        article.body = @body
        article = ImportWorkspace.articles.save(article)
    end
end