require "test_helper"

class PhotoBookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photo_bookmarks_index_url
    assert_response :success
  end

  test "should get show" do
    get photo_bookmarks_show_url
    assert_response :success
  end

  test "should get new" do
    get photo_bookmarks_new_url
    assert_response :success
  end

  test "should get edit" do
    get photo_bookmarks_edit_url
    assert_response :success
  end
end
