class JungleMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'https://jungle.com/login'
    mail(to: user.email, subject: 'Welcome to the Jungle')
  end
  def order_summary(order, user)
    @order, @user = order, user
    mail(to: @user.email, subject: "Your Jungle order: #{@order.id}")
  end
end

