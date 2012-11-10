require 'anemone'

namespace :krooma do
  task :crawl => :environment do
    Anemone.crawl('http://orangecounty.craigslist.org/cto/', :obey_robots_txt => false) do |spider|
      spider.on_every_page do |page|
        puts page.url

        title = page.doc.at('title').inner_html rescue nil

        begin
          ScrapedCar.create!(:url => page.url.to_s, :title => title, :content => page.body)
        rescue Exception => e
          puts e.message
        end
      end
      spider.focus_crawl do |page|
        page.links.find_all { |link| /^http\:\/\/orangecounty\.craigslist\.org\/cto\// =~ link.to_s }
      end
    end
  end
end