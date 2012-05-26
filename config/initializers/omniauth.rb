Rails.application.config.middleware.use OmniAuth::Builder do
	provider :linkedin, "jfj7t1kfl3sb", "4bLGZ1ngLDexh6Ul"
	provider :open_id, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end 
