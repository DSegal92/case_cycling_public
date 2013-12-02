class ContactMailer < ActionMailer::Base
  default from: "from@example.com"
   def newMessage()
   
    mail(to: "dls148@case.edu", :subject => "Test")
  end
end
