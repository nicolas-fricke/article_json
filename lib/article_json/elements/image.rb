module ArticleJSON
  module Elements
    class Image < Base
      attr_reader :source_url, :caption, :float

      # @param [String] source_url
      # @param [Array[ArticleJSON::Elements::Text]] caption
      # @param [Symbol] float
      def initialize(source_url:, caption:, float: nil)
        @type = :image
        @source_url = source_url
        @caption = caption
        @float = float
      end

      # Hash representation of this image element
      # @return [Hash]
      def to_h
        {
          type: type,
          source_url: source_url,
          float: float,
          caption: caption.map(&:to_h),
        }
      end

      class << self
        # Create a image element from Hash
        # @return [ArticleJSON::Elements::Image]
        def parse_hash(hash)
          new(
            source_url: hash[:source_url],
            caption: parse_hash_list(hash[:caption]),
            float: hash[:float]&.to_sym
          )
        end
      end
    end
  end
end

