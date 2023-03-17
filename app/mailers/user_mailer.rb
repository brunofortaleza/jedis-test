class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com'
    mail(to: @user.email, subject: 'Bem vindo ao site')
  end

  def update_user_email(user)
    @user = user
    @url  = 'http://example.com'
    mail(to: @user.email, subject: 'Seus dados foram alterados')
  end
end
