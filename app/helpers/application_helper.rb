module ApplicationHelper

  def stripe_btn_data
    @stripe_btn_data ||= {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Blocipedia Subscription - #{current_user.username}",
      amount: 19_00 #Amount.default
    }
  end
  
end
