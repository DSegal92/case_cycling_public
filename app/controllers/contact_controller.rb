class ContactController < ApplicationController
 	def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

	def create
    @message = Message.new(params[:message])
    ContactMailer.newMessage().deliver
    respond_to do |format|
      if @message.save
        format.html { redirect_to '/contact', notice: 'message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
