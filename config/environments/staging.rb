Devise::Application.configure do
  config.domain = "example.com"

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings[:address] = 'smtp.mandrillapp.com'
  config.action_mailer.smtp_settings[:port] = 587
  config.action_mailer.smtp_settings[:domain] = config.domain
  config.action_mailer.smtp_settings[:username] = 'patrick.c.connolly+ostn@gmail.com'
  # Demo API credentials (no credit card attached)
  config.action_mailer.smtp_settings[:password] = 'FAPLvTB7FNUJr1RqHpOT5w'
  config.action_mailer.smtp_settings[:authentication] = 'plain'
  config.action_mailer.smtp_settings[:enable_starttls_auto] = true
end
