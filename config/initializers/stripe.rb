require 'stripe'

Stripe.api_key = ENV['STRIPE_SECRET_KEY'] or fail 'STRIPE_SECRET_KEY required in env'
STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLIC_KEY'] or fail 'STRIPE_PUBLIC_KEY required in env'
