# encoding: utf-8
#!/home/justin/.rvm/rubies/ruby-1.9.2-p290/bin/ruby
require 'open-uri'
require 'nokogiri'

minors_url = 'http://www.umd.edu/catalog/index.cfm/show/content.chapter/c/127'
doc = Nokogiri::HTML.parse(open(minors_url))

raw_minors = []
doc.css('a.ctloglink').each do |a|
  raw_minors << a.text
end

minors = []
raw_minors.each do |m|
  chars = m
  m = chars.gsub("\r\n", "").squeeze(" ")
  minors << m
end

open('/home/justin/rails_projects/ventureboard/db/seeds.rb', 'a') do |f|
  minors.each do |m|
    f << "\nMinor.create(:name => " <<"\""<< m << "\"" << ")"
  end
end

