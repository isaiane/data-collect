require 'test_helper'

class Admin::ProfessionsControllerTest < ActionController::TestCase
  setup do
    @admin_profession = admin_professions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_professions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_profession" do
    assert_difference('Admin::Profession.count') do
      post :create, admin_profession: {  }
    end

    assert_redirected_to admin_profession_path(assigns(:admin_profession))
  end

  test "should show admin_profession" do
    get :show, id: @admin_profession
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_profession
    assert_response :success
  end

  test "should update admin_profession" do
    patch :update, id: @admin_profession, admin_profession: {  }
    assert_redirected_to admin_profession_path(assigns(:admin_profession))
  end

  test "should destroy admin_profession" do
    assert_difference('Admin::Profession.count', -1) do
      delete :destroy, id: @admin_profession
    end

    assert_redirected_to admin_professions_path
  end
end
