class HomeController < ApplicationController
	def index
		@blogs = Blog.find(:all, :order => "id DESC").first(2)
	end
end
