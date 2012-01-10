class EmleController < ApplicationController
  def index
    @user = User.find(1)
    #Emailer.welcome_email(@user).deliver
    @contacts = Contacts::Gmail.new(params[:user], params[:password]).contacts
  end

end
