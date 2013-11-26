class Position < ActiveRecord::Base
  attr_accessible :title, :member_id, :ranking
  has_one :member
end
