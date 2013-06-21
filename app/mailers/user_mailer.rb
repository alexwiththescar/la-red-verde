class UserMailer < ActionMailer::Base
  default :from => "laredverdeNOREPLY@gmail.com"

 

 def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"

    @message = message
    @sender = message.sender
    mail(:to => user.email, :subject => "You Have Recived A New Message!")
  end
end
