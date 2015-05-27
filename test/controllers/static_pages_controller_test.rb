require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @spiderman = users(:spiderman)
    sign_in(@spiderman)
  end

  test "gets home" do 
    get :home
    assert :success
  end
  
end
