ActionMailer::Base.smtp_settings = {
	:address				=> "smtp.mailgun.org",
	:port					=> "587",
	:domain					=> "app19686117.mailgun.org",
	:user_name				=> "postmaster@app19686117.mailgun.org",
	:password				=> ENV['MAILGUN_PASSWORD'],
	:authentication 		=> "plain"
}


ActionMailer::Base.delivery_method = :smtp