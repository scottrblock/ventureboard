class Program < ActiveRecord::Base
  attr_accessible :name

  has_many :program_affiliations
  has_many :users, :through => :program_affiliations

end
