class HomeController < ApplicationController
	def index
		@blogs = Blog.find(:all, :order => "id DESC").select { |b| b.internal == false}.first(2)
		@carousels = Carousel.all
	end
end
