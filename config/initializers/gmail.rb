ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'your.host.name',
  :user_name            => '<your_username>', # full email address (user@your.host.name.com)
  :password             => '<your_password>',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}