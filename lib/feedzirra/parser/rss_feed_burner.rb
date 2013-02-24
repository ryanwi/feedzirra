module Feedzirra

  module Parser
    # Parser for dealing with RSS feeds.
    class RSSFeedBurner
      include SAXMachine
      include FeedUtilities
      element :title
      element :description
      element :link, :as => :url
      element :"atom10:link", :as => :feed_url, :value => :href, :with => {:rel => "self"}
      elements :item, :as => :entries, :class => RSSFeedBurnerEntry

      def self.able_to_parse?(xml) #:nodoc:
        (/\<rss|\<rdf/ =~ xml) && (/feedburner/ =~ xml)
      end
    end

  end

end