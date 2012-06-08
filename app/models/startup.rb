# == Schema Information
#
# Table name: startups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#

class Startup < ActiveRecord::Base
  attr_accessible :user, :user_id, :name, :team, :team_attributes
 
  has_one :team, :validate => false, :dependent => :destroy
  belongs_to :user, :inverse_of => :startups
  accepts_nested_attributes_for :team

  validates :name, :presence => true
end
