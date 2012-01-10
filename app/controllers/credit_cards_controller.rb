class CreditCardsController < ApplicationController
  before_filter :auth, :only => [:create, :destroy]
  
  # POST /cards
  # POST /cards.json
  def create
    @card  = current_user.build_credit_card(params[:credit_card])
    if @card.save
      flash[:success] = "New Card created!"
      redirect_to account_url
    else
      render 'pages/home'
    end
  end
  
  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
  end
  
  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = CreditCard.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:credit_card])
        format.html { redirect_to account_url, notice: 'Card was successfully updated.' }
        format.json { head :ok }
      else
        @user = @card.user #we want to see the errors that might have been created
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end