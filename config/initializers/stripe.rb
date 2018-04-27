# Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_nSYYmqQvftYyHbv6XfIeZ1g4'],
  secret_key: ENV['sk_test_rqUbPLfiaboQE6azrBIkwGZK']
}

# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
