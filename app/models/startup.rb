class Startup < ActiveRecord::Base
  attr_accessible :name

  has_one :team
  belongs_to :user
end
