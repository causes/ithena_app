class PagesController < ApplicationController
  before_filter :auth, :only => [:account]
  
  def home
    @title = "Home"
    @current_user = current_user #we check in the view if this value is valid and show nav col as needed
  end

  def account
    @title = "Account"
    #before filter already ensures we have a current user
    @user = current_user
    @user_mobiles = current_user.mobiles
    @mobile = Mobile.new
    @user_card = current_user.credit_card
    puts @user_card
    @card = CreditCard.new #fallback to this in the view if @user_cards is empty
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
