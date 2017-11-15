class UsersMailer < ApplicationMailer
  def activation(user)
    @user = user
    mail(to: @user.email, subject: 'Email confirmation for Slip.it') do
      format.html
    end
  end
end
