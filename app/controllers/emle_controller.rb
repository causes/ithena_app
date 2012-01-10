class EmleController < ApplicationController
  def index
    @user = User.find(1)
    #Emailer.welcome_email(@user).deliver
    @contacts = Contacts::Gmail.new("ojimisa@gmail.com", "mydaddy4512").contacts
  end

end
