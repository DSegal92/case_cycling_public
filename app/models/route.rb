class Route < ActiveRecord::Base
  attr_accessible :description, :distance, :elevation, :name, :url, :verified
end
