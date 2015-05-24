require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest
  test "should display with pagination" do 
    get posts_path
    assert_template 'posts/index'
    
    assert_select 'div.pagination'
  end
end
