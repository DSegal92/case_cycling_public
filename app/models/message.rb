class Message < ActiveRecord::Base
  attr_accessible :contents, :respond_to_email, :subject, :name
  validates_presence_of :contents, :respond_to_email, :subject, :name
end
