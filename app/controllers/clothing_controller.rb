class ClothingController < ApplicationController
	def index
		@clothing_items = ClothingItem.all
	end
end
