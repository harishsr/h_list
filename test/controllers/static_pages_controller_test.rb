require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "gets home" do 
    get :home
    assert :success
  end
  
end
