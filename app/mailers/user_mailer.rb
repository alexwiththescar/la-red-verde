class UserMailer < ActionMailer::Base
  default :from => "laredverdenoreply@gmail.com"
 layout 'message_email' #
  def message_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end

