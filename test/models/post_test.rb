require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = User.create(email: "spiderman@hlist.com", encrypted_password: Devise.bcrypt(User, 'maryjane'))
    @post = @user.posts.build(title: "This is a test post", content: "This post has a lot of content.  "*6, 
                     phone: 9045556666, email: "test@hlist.com", user_id: users(:spiderman).id)
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

  test "should have correct email format" do 
    # invalid emails
    invalid_emails =  %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_emails.each do |email|
      @post.email = email
      assert_not @post.valid?, "#{email.inspect} is wrongly valid."
    end

    # valid emails
    valid_emails = %w(user@example.com USER@foo.com A_US_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn)
    valid_emails.each do |email|
      @post.email = email
      assert @post.valid?, "#{email.inspect} is wrongly invalid."
    end
  end
end
