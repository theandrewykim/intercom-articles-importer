module FixRedirects

    def transform_anchors
        @anchors.each do |anchor|
            anchor_uri = URI(anchor[:href])
            if anchor_uri.host == EXPORT_CUSTOM_DOMAIN
                anchor_uri.host = IMPORT_CUSTOM_DOMAIN
                uri_path = anchor_uri.path
                referenced_export_id = /\d+/.match(uri_path).to_s
                new_url_id = self.retrieve_url_import_id(referenced_export_id)
                anchor[:href] = converted_uri(anchor_uri, new_url_id) || anchor_uri.to_s
            end
        end
    end

    def converted_uri(anchor_uri, new_url_id)
        return nil if new_url_id.nil? 
        uri_path = anchor_uri.path
        new_uri_path = uri_path.gsub(/\d+/, new_url_id)
        anchor_uri.path = new_uri_path       
        anchor_uri.to_s
    end

    def retrieve_url_import_id(export_id)
        print "\n Detected URL to change - changing..."
        articles = ObjectSpace.each_object(ArticleCollection).first
        new_id = articles.find {|article| article.export_id == export_id}.import_id
    rescue
        print "n Detected link to collection or root Help Center - changing..."
    end
end