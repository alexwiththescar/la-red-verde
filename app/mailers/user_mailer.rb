class UserMailer < ActionMailer::Base
  default :from => "laredverdeNOREPLY@gmail.com"

 

 def newmessage_email(user)
    @user = user
    @url  = "http://example.com/login"

    @message = message

    mail(:to => user.email, :subject => "You Have Recived A New Message!")
  end
end
