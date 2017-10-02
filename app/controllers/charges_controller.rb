# def create
#    # Creates a Stripe Customer object, for associating
#    # with the charge
#    customer = Stripe::Customer.create(
#      email: current_user.email,
#      card: params[:stripeToken]
#    )
 
#    # Where the real magic happens
#    charge = Stripe::Charge.create(
#      customer: customer.id, # Note -- this is NOT the user_id in your app
#      amount: Amount.default,
#      description: "BigMoney Membership - #{current_user.email}",
#      currency: 'usd'
#    )
 
#    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
#    redirect_to user_path(current_user) # or wherever
 
#    # Stripe will send back CardErrors, with friendly messages
#    # when something goes wrong.
#    # This `rescue block` catches and displays those errors.
#    rescue Stripe::CardError => e
#      flash[:alert] = e.message
#      redirect_to new_charge_path
#  end

#   def new
#    @stripe_btn_data = {
#      key: "#{ Rails.configuration.stripe[:publishable_key] }",
#      description: "BigMoney Membership - #{current_user.name}",
#      amount: Amount.default
#    }
#  end

 class ChargesController < ApplicationController

  def create
    @user = current_user
    
    #Creates a Stripe Customer object, for associating with the charge.
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

  # Payment being made
  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: 10_00,
    description: "Upgrade to Premium Membership - #{current_user.email}",
    currency: 'usd'
  )

  @user.update_attributes(role: 'premium')
  @user.role = 'premium'
  @user.save

  flash[:notice] = "Thanks for the payment, #{current_user.email}! You can now create and edit private wikis."
  redirect_to root_path

  # Stripe will send back CardErrors, with friendly messages when something goes wrong.
  # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      # description: "Premium Membership - #{current_user.name}",
      amount: 10_00
    }
  end

  private

  def upgrade_user_role
    @user.role = 'premium'
  end

end