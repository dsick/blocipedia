class ChargesController < ApplicationController


  def new
    if user_signed_in?
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        #key: "pk_test_z3971ulOJS1heFJXHUYprE5Z",
        description: "Premium Blocipedia Subscription - #{current_user.username}",
        amount: 19_00 #Amount.default
      }
    else
      redirect_to root_path
      flash[:notice] = "You must be signed in to do that."
    end
  end

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: 19_00,
      description: "Premium Blocipedia Subscription - #{current_user.email}",
      currency: 'usd'
    )

    current_user.update_attributes!(role: 'premium')

    flash[:notice] = "Thanks for signing up for Blocipedia Premium, #{current_user.email}!"
    redirect_to edit_user_registration_path # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def downgrade
    #cancel sub
    current_user.update_attributes!(role: 'standard')
    Wiki.where(user_id: current_user.id, private: true).update_all(private: false)
    redirect_to edit_user_registration_path(current_user)
  end

end
