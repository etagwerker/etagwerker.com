require 'rspec'
require 'nokogiri'

# Adapted from https://gist.github.com/thbar/10be2ea924b81f78d24ab800461bfee3
RSpec.describe 'Fast Ruby Blog' do
  describe 'tests' do
    let(:post) { '/2019-best-tech-startups-in-philadelphia-89e98ec7e4f1.html' }
    let(:file_path) { "_site#{post}" }
    let(:url) { "https://etagwerker.com#{post}" }

    before do
      unless File.exists?(file_path)
        system("jekyll build")
      end
    end

    it 'generates correct URLs' do
      expect(File.exists?(file_path)).to be_truthy
    end

    it 'generates correct meta data' do
      doc = Nokogiri::HTML(IO.read(file_path))
      data = doc.search('meta[name^="twitter"]').inject({}) do |r, e|
        r[e['name']] = e['content'] ; r
      end
      expect(data['twitter:card']).to eq 'summary'
      expect(data['twitter:site']).to eq '@etagwerker'
      expect(data['twitter:title']).to eq 'Upgrading a Huge Monolith From Rails 4.0 to Rails 5.1 - Ruby on Rails Upgrades'
      expect(data['twitter:description']).to start_with('We recently collaborated with Power Home Remodeling on a Rails upgrade')
      expect(data['twitter:image:src']).to eq 'https://etagwerker.com/assets/images/profile.png'
    end

    it 'generates share button for twitter' do
      doc = Nokogiri::HTML(IO.read(file_path))
      href = doc.search('.icon-twitter').first['href']
      expect(href).to include(url)
    end

    it 'generates the RSS feed' do
      doc = Nokogiri::XML(IO.read('_site/rss.xml'))
      links = doc.xpath('/aws:feed/aws:link', 'aws' => 'http://www.w3.org/2005/Atom')
      expect(links.size).to eq 2
      expect(links[0].to_h).to eq({
        'type' => 'application/atom+xml',
        'href' => 'https://etagwerker.com/rss.xml',
        'rel' => 'self'
      })
      expect(links[1].to_h).to eq({
        'type' => 'text/html',
        'href' => 'https://etagwerker.com/',
        'rel' => 'alternate'
      }, )
    end
  end
end
