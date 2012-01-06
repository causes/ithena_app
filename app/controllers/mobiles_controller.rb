class MobilesController < ApplicationController
  before_filter :auth, :only => [:create, :destroy]
  
  # POST /mobiles
  # POST /mobiles.json
  def create
    @mobile  = current_user.mobiles.build(params[:mobile])
    if @mobile.save
      flash[:success] = "New mobile added created!"
      redirect_to account_url
    else
      render 'pages/home'
    end
  end
  
  # DELETE /mobiles/1
  # DELETE /mobiles/1.json
  def destroy
  end
  
  # PUT /mobiles/1
  # PUT /mobiles/1.json
  def update
    @mobile = Mobile.find(params[:id])

    respond_to do |format|
      if @mobile.update_attributes(params[:mobile])
        format.html { redirect_to account_url, notice: 'Mobile was successfully updated.' }
        format.json { head :ok }
      else
        @user = @mobile.user #we want to see the errors that might have been created
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end