module ArticleJSON
  module Export
    module FacebookInstantArticle
      module Elements
        class Image < Base
          include ArticleJSON::Export::Common::HTML::Elements::Image

          private

          def node_opts; end
        end
      end
    end
  end
end
