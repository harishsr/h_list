require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @user = users(:spiderman)
    @post = posts(:one)
    @posts = Post.all
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should get index" do 
    get :index
    assert_response :success
  end

end
