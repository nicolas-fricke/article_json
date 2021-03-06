describe ArticleJSON::Export::FacebookInstantArticle::Elements::Image do
  subject(:element) { described_class.new(source_element) }

  let(:source_element) do
    ArticleJSON::Elements::Image.new(
      source_url: '/foo/bar.jpg',
      caption: caption,
      float: float
    )
  end
  let(:float) { nil }
  let(:caption) { [ArticleJSON::Elements::Text.new(content: 'Foo Bar')] }

  describe '#export' do
    subject { element.export.to_html(save_with: 0) }

    context 'when the image is not floating' do
      let(:expected_html) do
        '<figure><img src="/foo/bar.jpg">' \
          '<figcaption>Foo Bar</figcaption></figure>'
      end
      it { should eq expected_html }
    end

    context 'when the image is floating on the left' do
      let(:float) { :left }
      let(:expected_html) do
        '<figure class="float-left"><img src="/foo/bar.jpg">' \
          '<figcaption>Foo Bar</figcaption></figure>'
      end
      it { should eq expected_html }
    end

    context 'when the image is floating on the right' do
      let(:float) { :right }
      let(:expected_html) do
        '<figure class="float-right"><img src="/foo/bar.jpg">' \
          '<figcaption>Foo Bar</figcaption></figure>'
      end
      it { should eq expected_html }
    end

    context 'when no caption is provided' do
      let(:caption) { [] }
      let(:expected_html) { '<figure><img src="/foo/bar.jpg"></figure>' }
      it { should eq expected_html }
    end
  end
end
