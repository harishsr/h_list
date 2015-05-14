require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(title: "This is a test post", content: "This post has a lot of content.  "*6, 
                     phone: 9045556666, email: "test@h_list.com", user_id: users(:spiderman).id)
  end

  test "should create a new post" do 
    assert @post.valid?
  end

  test "should require title and be under 100 chars" do 
    @post.title = ""
    assert_not @post.valid?, "empty title"

    @post.title = "a"*100
    assert @post.valid?, "100 chars exactly"

    @post.title = "a"*101
    assert_not @post.valid?, "over 100 chars"
  end

  test "should require content" do 
    @post.content = ""
    assert_not @post.valid?
  end

  test "should have correct phone length" do 
    @post.phone = 1
    assert_not @post.valid?

    @post.phone = 1112223333
    assert @post.valid?

  end
end
