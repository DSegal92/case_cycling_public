class SponsorsController < ApplicationController
	def index
		@top_tier = Sponsor.where(:tier => 1)
		@second_tier = Sponsor.where(:tier => 2)
	end
end
