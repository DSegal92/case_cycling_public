class Equipment < ActiveRecord::Base
  attr_accessible :name, :quantity, :member_ids
  has_and_belongs_to_many	:members
  
end
