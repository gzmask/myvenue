# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_myvenue_online_session',
  :secret      => '075d81814407ff85324bd2b7914d3206b8c47955cd1f3746e2619f70bd9c8575c601b0538890ffb9ef2ca1b679061ecedf3a80a8394e2d3ea717cacd8b5c8731'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
