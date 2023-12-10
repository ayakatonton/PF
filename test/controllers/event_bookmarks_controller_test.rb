require "test_helper"

class EventBookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_bookmarks_index_url
    assert_response :success
  end

  test "should get show" do
    get event_bookmarks_show_url
    assert_response :success
  end

  test "should get new" do
    get event_bookmarks_new_url
    assert_response :success
  end

  test "should get edit" do
    get event_bookmarks_edit_url
    assert_response :success
  end
end
