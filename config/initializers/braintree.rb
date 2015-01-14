require 'braintree'

Braintree::Configuration.environment = ENV['BRAINTREE_ENVIRONMENT'] || :sandbox
Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID'] or fail 'BRAINTREE_MERCHANT_ID required in env'
Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY'] or fail 'BRAINTREE_PUBLIC_KEY required in env'
Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY'] or fail 'BRAINTREE_PRIVATE_KEY required in env'

BRAINTREE_CLIENTSIDE_ENCRYPTION_KEY = ENV['BRAINTREE_CLIENTSIDE_ENCRYPTION_KEY'] or fail 'BRAINTREE_CLIENTSIDE_ENCRYPTION_KEY required in env'
