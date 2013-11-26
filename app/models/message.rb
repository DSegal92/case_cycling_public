class Message < ActiveRecord::Base
  attr_accessible :contents, :respond_to_email, :subject
end
