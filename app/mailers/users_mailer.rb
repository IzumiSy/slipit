class UsersMailer < ApplicationMailer
  def activation(user)
    @user = user
    mail(to: @user.email, subject: 'Email confirmation for Slip.it')
  end
end
