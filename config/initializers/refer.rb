Refer.code_generator = -> (referrer) { "#{referrer.id}-#{SecureRandom.alphanumeric(6)}".upcase }
Refer.cookie_length = 15.days