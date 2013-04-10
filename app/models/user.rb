# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :password, :emails_attributes

  has_many :emails
  accepts_nested_attributes_for :emails, :reject_if => :all_blank

end
