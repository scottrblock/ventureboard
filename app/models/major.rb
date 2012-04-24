# == Schema Information
#
# Table name: majors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Major < ActiveRecord::Base
  attr_accessible :name, :id
  has_and_belongs_to_many :users
end
