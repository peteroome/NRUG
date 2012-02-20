Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "340849322620304", "f7f521d6fa28f51872e8176051a15a82", :scope => 'email,offline_access,read_stream', :display => 'popup'
  provider :twitter, "bNJMov8RYfXoMTx6GEAwsg", "kvmWhEqkbuVZcdt8wm1a0YwKtLDeYpQyQdLejOv2U"
end