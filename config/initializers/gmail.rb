ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'le-red-verde.herokuapp.com',
  :user_name            => 'laredverdeNOREPLY@gmail.com', # full email address (user@your.host.name.com)
  :password             => 'GromGrom1',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}