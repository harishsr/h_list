require 'test_helper'

class PostsCrudTest < ActionDispatch::IntegrationTest
  def setup
    @post = { title: "This is the title",
               content: "Detailed comment."*10,
               phone: 9991118888,
               email: "email@h_list.com",
               user_id: users(:spiderman).id }
    @p = Post.create(@post)
  end

  test "creates a new post successfully" do 
    get new_post_path
    assert_template 'posts/new'
    assert_difference 'Post.count', 1 do 
      post posts_path, post: @post
    end
    assert_template 'posts/show'
  end

  test "fails to create a new post with inaccurate info" do 
    get new_post_path
    assert_no_difference 'Post.count' do 
      post posts_path, post: { title: "", content: "", phone: 1111, email: 00 }
    end
    assert_template 'posts/new'
  end

  test "shows a new post correctly" do 
    get new_post_path
    post posts_path, post: @post
    assert_template 'posts/show'
    assert_equal 'Your new posting was created.', flash[:success]
    assert_select 'h2', @post[:title]
    assert_select 'h2+p', @post[:content]
  end

  test "edits a post successfully" do 
    # Get edit info
    get edit_post_path(@p)
    assert_template 'posts/edit'
    assert_select '.edit_post' do 
      assert_select 'textarea', @p[:content]
    end

    # Patch a post with updated info
    title = "Edited title"
    patch post_path @p, post: { title: title }
    assert_template 'posts/show'
    assert_select 'h2', title
  end

  test "deletes a post successfully" do 
    get post_path(@p)
    assert_difference 'Post.count', -1 do 
      delete post_path(@p)
    end
  end
end
