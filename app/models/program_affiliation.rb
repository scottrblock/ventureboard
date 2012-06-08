# == Schema Information
#
# Table name: program_affiliations
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  program_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class ProgramAffiliation < ActiveRecord::Base
	belongs_to :user
	belongs_to :program
end
