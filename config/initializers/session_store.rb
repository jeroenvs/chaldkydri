# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chaldkydri_session',
  :secret      => '9d86a84fc7e8a5daa1cde0f5ac8ff1c4f469292ee9ed175b3b73303482d9ca157353a6a678fd3351cf16db244991b2e3afc3f326d60dc309ee97809bab38a5e6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
