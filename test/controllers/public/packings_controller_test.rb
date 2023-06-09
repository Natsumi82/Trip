require "test_helper"

class Public::PackingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_packings_index_url
    assert_response :success
  end

  test "should get new" do
    get public_packings_new_url
    assert_response :success
  end

  test "should get show" do
    get public_packings_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_packings_edit_url
    assert_response :success
  end
end
