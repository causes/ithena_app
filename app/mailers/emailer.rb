class Emailer < ActionMailer::Base
  default from: "info@topupgenie.com"
  
  def welcome_email(user)
      @user = user
      @url  = "http://ithena.heroku.com/sigin"
      mail(:to => user.email, :subject => "Welcome to My Topup Genie")
    end
end
