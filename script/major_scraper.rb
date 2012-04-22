# encoding: utf-8
#!/home/justin/.rvm/rubies/ruby-1.9.2-p290/bin/ruby
require 'open-uri'
require 'nokogiri'

majors_url = 'http://www.admissions.umd.edu/academics/majors.cfm'
doc = Nokogiri::HTML.parse(open(majors_url))

raw_majors = []
doc.css('p > a').each do |a|
  raw_majors << a.text
end

majors = []
raw_majors.each do |m|
  chars = m 
  m = chars.gsub("\r\n", "").squeeze(" ") 
  majors << m
end

open('/home/justin/rails_projects/ventureboard/db/seeds.rb', 'a') do |f|
  majors.each do |m|
    f << "\nMajor.create(:name => " <<"\""<< m << "\"" << ")"
  end
end
