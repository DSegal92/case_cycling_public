class Message < ActiveRecord::Base
  attr_accessible :contents, :respond_to, :subject
end
