require 'test_helper'

class Admin::RecordsControllerTest < ActionController::TestCase
  setup do
    @admin_record = admin_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_record" do
    assert_difference('Admin::Record.count') do
      post :create, admin_record: {  }
    end

    assert_redirected_to admin_record_path(assigns(:admin_record))
  end

  test "should show admin_record" do
    get :show, id: @admin_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_record
    assert_response :success
  end

  test "should update admin_record" do
    patch :update, id: @admin_record, admin_record: {  }
    assert_redirected_to admin_record_path(assigns(:admin_record))
  end

  test "should destroy admin_record" do
    assert_difference('Admin::Record.count', -1) do
      delete :destroy, id: @admin_record
    end

    assert_redirected_to admin_records_path
  end
end
