class UserMailer < ActionMailer::Base
 def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "thesalesstar@gmail.com")
  end
end
