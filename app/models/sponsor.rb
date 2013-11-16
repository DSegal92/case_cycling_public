class Sponsor < ActiveRecord::Base
  attr_accessible :description, :name, :picture_url, :url
end
