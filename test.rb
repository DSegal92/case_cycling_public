def get_output
	@test = %x{ git blame app/controllers/contact_controller.rb --porcelain}
end

get_output