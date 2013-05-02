class Shout < ActiveRecord::Base
	default_scope order: 'created_at DESC'
  attr_accessible :status, :user_id
  validates :user_id, :presence => true
  validates :status, :presence => true,
									  :length => { :minimum => 140 }
  belongs_to :user
end
