ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def sign_in_as(user)
    post_via_redirect user_session_path, 'user[:email]' => user.email, 
                           'user[:encrypted_password]' => 'password1'
  end
end
