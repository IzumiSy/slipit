class UsersMailer < ApplicationMailer
  def activation(user)
    @user = user
    mail(to: @user.email, subject: 'Slip.it: Email confirmation')
  end
end
