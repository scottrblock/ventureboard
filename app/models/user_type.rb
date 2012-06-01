# == Schema Information
#
# Table name: user_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class UserType < ActiveRecord::Base
  attr_accessible :name
  has_many :users
  
  def getQuirkyName
	quirkyName = ''
	if id == 1
	  quirkyName = '<span title="Technical">Wizardly Programmers</span>'
	elsif id == 2
	  quirkyName = '<span title="Business">Money Makers</span>'
	elsif id == 3
	  quirkyName ='<span title="Creative">Crafty Creatives</span>'
	end  
	quirkyName.html_safe
  end
end
