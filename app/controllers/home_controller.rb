class HomeController < ApplicationController
	def index
		@blogs = Blog.find(:all, :order => "id DESC").select { |b| b.internal == false}.first(2)
		@carousels = Carousel.all
		@events = Event.where(['date >= ?', DateTime.yesterday]).order(:date)
		@rides = Event.where(['date >= ?', DateTime.yesterday]).order(:date)
	end
end
