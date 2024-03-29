# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user_types = []
["Technical", "Business", "Creative", "Advisor"].each do |type|
  user_types << UserType.create(:name => type)
end

programs = []
["Robert H. Smith School of Business", "Computer Science Department", "Hinman CEO's", 
 "Entrepreneurship and Innovation Program", "College Park Scholars", "University Honors"].each do |p|
  programs << Program.create(:name => p)
end

majors = []
Major.create(:name => "Accounting (Business)")
Major.create(:name => "Aerospace Engineering")
Major.create(:name => "African-American Studies")
Major.create(:name => "Agricultural and Resource Economics")
Major.create(:name => "Agricultural and Veterinary Medicine")
Major.create(:name => "Agricultural Education")
Major.create(:name => "Agricultural General")
Major.create(:name => "Agricultural Science & Technology")
Major.create(:name => "American Studies")
Major.create(:name => "Animal Sciences: Animal Care and Management")
Major.create(:name => "Animal Sciences: Equine Studies")
Major.create(:name => "Animal Sciences: Laboratory Animal Care")
Major.create(:name => "Animal Sciences: Sciences/PreProfessional")
Major.create(:name => "Animal Sciences: Animal Biotechnology")
Major.create(:name => "Anthropology")
Major.create(:name => "Arabic Studies")
Major.create(:name => "Architecture")
Major.create(:name => "Art Education")
Major.create(:name => "Art History")
Major.create(:name => "Astronomy")
Major.create(:name => "Atmospheric and Oceanic Science")
Major.create(:name => "Behavioral and Community Health")
Major.create(:name => "Biochemistry")
Major.create(:name => "Bioengineering")
Major.create(:name => "Biological Sciences: Cell Biology and Genetics")
Major.create(:name => "Biological Sciences: Ecology and Evolution")
Major.create(:name => "Biological Sciences: General Biology")
Major.create(:name => "Biological Sciences: Microbiology")
Major.create(:name => "Biological Sciences: Physiology and Neurobiology")
Major.create(:name => "Central European, Russian and Eurasian Studies")
Major.create(:name => "Chemical Engineering")
Major.create(:name => "Chemistry")
Major.create(:name => "Chinese")
Major.create(:name => "Civil Engineering")
Major.create(:name => "Classical Languages and Literatures")
Major.create(:name => "Communication")
Major.create(:name => "Computer Engineering")
Major.create(:name => "Computer Science")
Major.create(:name => "Criminology and Criminal Justice")
Major.create(:name => "Dance")
Major.create(:name => "Dietetics")
Major.create(:name => "Early Childhood Education")
Major.create(:name => "Ecological Technology Design")
Major.create(:name => "Economics")
Major.create(:name => "Education (Teacher:Undecided)")
Major.create(:name => "Electrical Engineering")
Major.create(:name => "Elementary Education")
Major.create(:name => "Engineering (Undecided)")
Major.create(:name => "English Language Arts Education")
Major.create(:name => "English Language and Literature")
Major.create(:name => "Environmental Health")
Major.create(:name => "Environmental Science and Policy")
Major.create(:name => "Environmental Science and Technology")
Major.create(:name => "Family Science")
Major.create(:name => "Finance (Business)")
Major.create(:name => "Fire Protection Engineering")
Major.create(:name => "Food Science")
Major.create(:name => "Foreign Language Education French Language and Literature")
Major.create(:name => "General Business")
Major.create(:name => "Geography")
Major.create(:name => "Geology")
Major.create(:name => "German Language and Literature")
Major.create(:name => "Government and Politics")
Major.create(:name => "Hearing and Speech Sciences")
Major.create(:name => "History")
Major.create(:name => "Horticulture and Crop Production")
Major.create(:name => "Individual Studies")
Major.create(:name => "Information Systems (Business)")
Major.create(:name => "International Business")
Major.create(:name => "Italian Business")
Major.create(:name => "Italian Language, Culture and Literature")
Major.create(:name => "Japanese")
Major.create(:name => "Jewish Studies")
Major.create(:name => "Journalism: Undecided Journalism: Broadcast News Journalism: Magazine Journalism: News/Editorial")
Major.create(:name => "Kinesiology")
Major.create(:name => "Landscape Architecture")
Major.create(:name => "Landscape Management")
Major.create(:name => "Letters and Sciences (advising for undecided students, prior to picking a degree-granting program)")
Major.create(:name => "Linguistics")
Major.create(:name => "Logistics, Transportation and Supply Chain Management (Business)")
Major.create(:name => "Marketing (Business)")
Major.create(:name => "Materials Science (Engineering)")
Major.create(:name => "Mathematics")
Major.create(:name => "Mathematics Education")
Major.create(:name => "Mechanical Engineering")
Major.create(:name => "Music: Professional Program")
Major.create(:name => "Music: Liberal Arts Program")
Major.create(:name => "Music: Education")
Major.create(:name => "Natural Resources Management")
Major.create(:name => "Nutritional Sciences")
Major.create(:name => "Operations Management (Business)")
Major.create(:name => "Persian Studies")
Major.create(:name => "Philosophy")
Major.create(:name => "Physical Education")
Major.create(:name => "Physical Sciences")
Major.create(:name => "Physics")
Major.create(:name => "Plant Sciences")
Major.create(:name => "Political Science")
Major.create(:name => "Psychology")
Major.create(:name => "Romance Languages")
Major.create(:name => "Russian Language and Literature")
Major.create(:name => "Science Education")
Major.create(:name => "Social Studies Education")
Major.create(:name => "Sociology")
Major.create(:name => "Soil and Watershed Science")
Major.create(:name => "Spanish Language and Literature")
Major.create(:name => "Special Education")
Major.create(:name => "Studio Art")
Major.create(:name => "Theatre")
Major.create(:name => "Turf and Golf Course Management")
Major.create(:name => "Undecided (Letters and Sciences; advising for undecided students, prior to picking a degree-granting program)")
Major.create(:name => "Urban Forestry")
Major.create(:name => "Women's Studies")
Major.create(:name => "Pre-Dentistry")
Major.create(:name => "Pre-Law")
Major.create(:name => "Pre-Medicine")
Major.create(:name => "Pre-Physical Therapy")
Major.create(:name => "Pre-Veterinary Medicine")

majors << Major.all

Minor.create(:name => "Actuarial Mathematics")
Minor.create(:name => "Agribusiness Economics")
Minor.create(:name => "Ancient Greek Language and Literature")
Minor.create(:name => "Art History")
Minor.create(:name => "Asian American Studies")
Minor.create(:name => "Astronomy")
Minor.create(:name => "Atmospheric Chemistry")
Minor.create(:name => "Atmospheric Sciences")
Minor.create(:name => "Black Women's Studies")
Minor.create(:name => "Chinese Language")
Minor.create(:name => "Mythology, Classical")
Minor.create(:name => "Community Health")
Minor.create(:name => "Computer Science")
Minor.create(:name => "Earth History")
Minor.create(:name => "Earth Material Properties")
Minor.create(:name => "Engineering Leadership Development")
Minor.create(:name => "Environmental Economics and Policy")
Minor.create(:name => "French Studies")
Minor.create(:name => "Germanic Studies")
Minor.create(:name => "Geographic Information Science")
Minor.create(:name => "Geophysics")
Minor.create(:name => "Hearing and Speech Sciences")
Minor.create(:name => "Hydrology")
Minor.create(:name => "Human Development")
Minor.create(:name => "International Development and Conflict Management")
Minor.create(:name => "Engineering, International")
Minor.create(:name => "Israel Studies")
Minor.create(:name => "Italian Language and Culture")
Minor.create(:name => "Japanese")
Minor.create(:name => "Jewish Studies")
Minor.create(:name => "Korean Studies")
Minor.create(:name => "Landscape Management")
Minor.create(:name => "Latin Language and Literature")
Minor.create(:name => "Leadership Studies")
Minor.create(:name => "Linguistics")
Minor.create(:name => "Mathematics")
Minor.create(:name => "Meteorology")
Minor.create(:name => "Middle East Studies")
Minor.create(:name => "Military Studies")
Minor.create(:name => "Music Performance")
Minor.create(:name => "Nanoscale Science and Technology")
Minor.create(:name => "Engineering, Nuclear")
Minor.create(:name => "Neuroscience")
Minor.create(:name => "Persian Studies")
Minor.create(:name => "Philosophy")
Minor.create(:name => "Physics")
Minor.create(:name => "Portuguese Language, Literatures, and Cultures")
Minor.create(:name => "Project Management")
Minor.create(:name => "Religious Studies")
Minor.create(:name => "Resource and Agricultural Policy in Economic Development")
Minor.create(:name => "Rhetoric")
Minor.create(:name => "Russian Studies")
Minor.create(:name => "Education, Second Language")
Minor.create(:name => "Education, Secondary")
Minor.create(:name => "Soil Science")
Minor.create(:name => "Education, Special")
Minor.create(:name => "Spanish Language and Cultures")
Minor.create(:name => "Spanish Language, Business, and Cultures")
Minor.create(:name => "Sport Commerce and Culture")
Minor.create(:name => "Statistics")
Minor.create(:name => "Surficial Geology")
Minor.create(:name => "U.S. Latina/o Studies")
Minor.create(:name => "Global Terrorism")
Minor.create(:name => "Lesbian, Gay, Bisexual and Transgender Studies")
Minor.create(:name => "Global Studies Minor Program")
Minor.create(:name => "Technology Entrepreneurship")
Minor.create(:name => "Planetary Sciences")
Minor.create(:name => "Survey Methodology")
Minor.create(:name => "Creative Writing")


# 13 Techincal users
User.create!(:first_name => "John", :last_name => "Smith", :email => "test1@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test2@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test3@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test4@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test5@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test6@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test7@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test8@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test9@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test10@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test11@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test12@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test13@test.com", 
            :user_type => user_types[0], :majors => Major.where(:id => 38), :password => "test123")

# 13 Business users
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test14@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 1), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test15@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 55), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test16@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 1), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test17@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 55), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test18@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 1), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test19@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 55), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test20@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 1), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test21@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 55), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test22@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 1), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test23@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 55), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test24@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 1), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test25@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 55), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test26@test.com", 
            :user_type => user_types[1], :majors => Major.where(:id => 1), :password => "test123")

# 13 Creative users
User.create!(:first_name => "John", :last_name => "Smith", :email => "test27@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 1), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test28@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 3), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test29@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 6), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test30@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 9), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test31@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 12), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test32@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 15), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test33@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 18), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test34@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 21), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test35@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 24), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test36@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 27), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test37@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 30), :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test38@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 33), :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test39@test.com", 
             :user_type => user_types[2], :majors => Major.where(:id => 36), :password => "test123")

# 11 Advisor users
User.create!(:first_name => "John", :last_name => "Smith", :email => "test40@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test41@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test42@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test43@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test44@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test45@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test46@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test47@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test48@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "John", :last_name => "Smith", :email => "test49@test.com", 
             :user_type => user_types[3], :password => "test123")
User.create!(:first_name => "Jane", :last_name => "Smith", :email => "test50@test.com", 
             :user_type => user_types[3], :password => "test123")
