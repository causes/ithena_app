class PagesController < ApplicationController
  before_filter :auth, :only => [:account]
  
  def home
    @title = "Home"
  end

  def account
    @title = "Account"
    #before filter already ensures we have a current user
    @user = current_user
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

  def faq
    @title = "Faqs"
  end

end
