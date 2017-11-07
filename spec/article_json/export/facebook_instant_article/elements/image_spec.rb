describe ArticleJSON::Export::FacebookInstantArticle::Elements::Image do
  subject(:element) { described_class.new(source_element) }

  let(:source_element) do
    ArticleJSON::Elements::Image.new(
      source_url: '/foo/bar.jpg',
      caption: [caption]
    )
  end
  let(:caption) { ArticleJSON::Elements::Text.new(content: 'Foo Bar') }

  describe '#export' do
    subject { element.export.to_html(save_with: 0) }

    context 'when the image is not floating' do
      let(:expected_html) do
        '<figure><img src="/foo/bar.jpg">' \
          '<figcaption>Foo Bar</figcaption></figure>'
      end
      it { should eq expected_html }
    end
  end
end
