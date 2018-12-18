require 'test_helper'

class StacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stacks_index_url
    assert_response :success
  end

  test "should get show" do
    get stacks_show_url
    assert_response :success
  end

  test "should get new" do
    get stacks_new_url
    assert_response :success
  end

  test "should get edit" do
    get stacks_edit_url
    assert_response :success
  end

end
