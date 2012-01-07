class EmleController < ApplicationController
  def index
    @user = User.find(1)
    Emailer.welcome_email(@user).deliver
  end

end
