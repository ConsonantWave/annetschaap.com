# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_annet_session',
  :secret      => 'f35521383d4f174bba101c43e2d5afb66e999cae93c681428244fb7fd6fa1876efdb83cb13413ef6cdab91311bdd5bc63145b77c0c8d04d3a6166675051ca5ed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
