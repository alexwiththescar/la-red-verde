class UserMailer < ActionMailer::Base
  default :from => "laredverdenoreply@gmail.com"

  def message_notification(recipient)
   

    
    mail(:to => recipient.email, :subject => "Welcome to My Awesome Site")
   
  end
end

