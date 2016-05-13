 # Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_z3971ulOJS1heFJXHUYprE5Z'],
   secret_key: ENV['sk_test_j3MrCgSgv8hH7fFICzUa3SKI']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]