# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cloister_session',
  :secret      => '44dd3afac2c6d4d994e90ae465b9d2a55c9f7882f378c050a1271a40f874145c9eabaf61e3c47e1d08cab6edec7eaa363dd616a5f83074f03af29498dfd48f02'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
