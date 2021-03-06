# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_workouts_session',
  :secret      => 'c8e46eb801802e7f8bcfebb2fb4de66deabecb660fb10193eecd755b08224a7509933109b363255bba1d370e23c7cdc74afcf07db51a609be551c20bc0aafab5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
