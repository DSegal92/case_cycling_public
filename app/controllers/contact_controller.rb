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
   
    respond_to do |format|
      if @message.save
        subject = @message.subject
        name = @message.name
        email = @message.respond_to_email
        contents = @message.contents
        ContactMailer.newMessage(subject, name, email, contents).deliver
        format.html { redirect_to "/contact", notice: 'Your message has been sent, thanks for writing!'}
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { redirect_to "/contact", notice: 'Unable to send message, please make sure all required fields are filled.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
