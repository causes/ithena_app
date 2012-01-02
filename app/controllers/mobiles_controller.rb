class MobilesController < ApplicationController
  before_filter :auth, :only => [:create, :destroy]

  def create
    @mobile  = current_user.mobiles.build(params[:mobile])
    if @mobile.save
      flash[:success] = "New mobile added created!"
      redirect_to account_url
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end