Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, 'APP_ID', 'APP_SECRET', :scope => 'email', :display => 'page'
  #provider :facebook, "442438942519516", "ae13a5b7627210200db97aa129431cd8", :display => 'page'
  provider :facebook, "442438942519516", "ae13a5b7627210200db97aa129431cd8", {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  
  OmniAuth.config.on_failure = Proc.new do |env|
    "AuthenticationsController".constantize.action(:omniauth_failure).call(env)
  end
end