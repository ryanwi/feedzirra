module Feedzirra

  module Parser
    # Parser for dealing with Feedburner Atom feeds.
    class AtomFeedBurner
      include SAXMachine
      include FeedUtilities
      element :title
      element :subtitle, :as => :description
      element :link, :as => :url, :value => :href, :with => {:type => "text/html"}
      element :"atom10:link", :as => :feed_url, :value => :href, :with => {:rel => "self"}
      elements :entry, :as => :entries, :class => AtomFeedBurnerEntry

      def self.able_to_parse?(xml) #:nodoc:
        ((/Atom/ =~ xml) && (/feedburner/ =~ xml) && !(/\<rss|\<rdf/ =~ xml)) || false
      end
    end

  end

end