require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @user = users(:spiderman)
    @post = posts(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get post_path(@post)
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
