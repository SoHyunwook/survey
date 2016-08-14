require 'test_helper'

class BoardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get postpage" do
    get :postpage
    assert_response :success
  end

  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get real_edit" do
    get :real_edit
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
