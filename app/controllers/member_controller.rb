class MemberController < ApplicationController
	def index
		@members = Member.where(Member.arel_table[:is_officer].not_eq(true)).where("is_verified" => true)
		@officers = Member.where("is_officer" => true)
		@coaches = Coach.all
		@positions = Position.all
	end
end