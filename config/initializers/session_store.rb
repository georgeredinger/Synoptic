# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_synoptic_session',
  :secret      => 'b51ff45daf18f5a3902e7285db06a9864fcf74f7a2513fbdd6eb7d09ed30f65765898123c0f45071d9af8c4e846c6dd1644a973e5c5a0de470b0e99708b504a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
