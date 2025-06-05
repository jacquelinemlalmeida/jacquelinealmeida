class UserMailer < ApplicationMailer
  default from: 'jackellitamarques@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bem vindo!')
  end
end
