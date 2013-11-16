class Position < ActiveRecord::Base
  attr_accessible :title
  belongs_to :member
end
