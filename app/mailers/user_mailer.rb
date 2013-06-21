class UserMailer < ActionMailer::Base
  default :from => "laredverdenoreply@gmail.com"

 

 def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    @message = message
    @sender = message.sender
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
