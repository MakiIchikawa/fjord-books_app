# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GIT_OAUTH_ID'], ENV['GIT_OAUTH_SECRET']
end
