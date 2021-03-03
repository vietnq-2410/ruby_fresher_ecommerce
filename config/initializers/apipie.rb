Apipie.configure do |config|
  config.app_name                = "App"
  config.app_info                = "This is document for app."
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/api/doc"
  config.languages                = ["en", "vi"]
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/*.rb"

  config.authenticate = Proc.new do
    authenticate_or_request_with_http_basic do |username, password|
      username == "vietnq812@gmail.com" && password == "123123123"
   end 
 end
end
