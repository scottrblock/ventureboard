# == Schema Information
#
# Table name: programs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Program < ActiveRecord::Base
  attr_accessible :name

  has_many :program_affiliations
  has_many :users, :through => :program_affiliations

end
