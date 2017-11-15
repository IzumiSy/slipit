Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = 'no-reply@slipit.me'
  config.rotate_csrf_on_sign_in = true
  config.sign_in_guards = [ConfirmationGuard]
end
