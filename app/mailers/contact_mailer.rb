class ContactMailer < ActionMailer::Base
  default from: "postmaster@casecycling.com"

   def newMessage(subject, name, email, contents)  
   	@subject = subject
   	@name = name
   	@email = email
   	@contents = contents 
    mail(:to => "contactcasecycling@gmail.com", 
    	 :subject => "New Email about " + @subject,
    	 :reply_to => @email)
  end
end
