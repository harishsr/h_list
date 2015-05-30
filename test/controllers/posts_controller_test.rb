require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = users(:spiderman)
    @other_user = users(:batman)
    @post = posts(:one)
    @posts = Post.all
  end

  test "should get new" do
    # When not logged in
    get :new
    assert_response :redirect, "wrongly gets 'new' when not logged in."

    # When logged in
    sign_in @user
    get :new
    assert_response :success, "does not get 'new' when logged in."
  end

  test "should get show" do
    sign_in @user
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    # When not logged in
    get :edit, id: @post
    assert_response :redirect

    # When logged in as the wrong user
    sign_in @other_user
    get :edit, id: @post
    assert_response :redirect
  end

  test "should get index" do 
    # Without logging in
    get :index
    assert_response :success
  end

end
