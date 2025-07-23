Refer.code_generator = -> (referrer) { "#{referrer.id}-#{SecureRandom.hex(6)}".upcase }
Refer.cookie_length = 15.days