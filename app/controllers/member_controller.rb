class MemberController < ApplicationController
	def index
		@members = Member.where("is_officer" => false).sort_by { |a| (a.name.split("\s").second()) }
		@officers = Member.where("is_officer" => true)
		@coaches = Coach.all
		@positions = Position.all
	end
end